import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'app_settings.dart';
import 'app_settings_cubit.dart';

// #TODO: This appears to crash app probably if permissions aren't granted
class SpeedWidget extends StatefulWidget {
  // const SpeedWidget({Key key}) : super(key: key);

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<SpeedWidget> {
  double _rawSpeed = -1;
  double _speedConst;
  String _speed;
  String _units;
  int _separation;
  String _separationText;

  Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  StreamSubscription<Position> positionStream;
  Position _position;
  void startTimer() {
    positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 1,
    ).listen((Position position) {
      _position = position;
      setState(() {
        _rawSpeed = position.speed;
      });
    }, onError: (error) {
      setState(() {
        _rawSpeed = -1;
      });
      timer?.cancel();
      startTimer(); // Restarts stream properly?
    });
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) async {
      if (_position != null) {
        Duration diff = DateTime.now().difference(_position.timestamp);
        if (diff > Duration(seconds: 2)) {
          setState(() {
            _rawSpeed = -1;
          });
        }
      }
    });
  }

  void stopTimer() async {
    timer?.cancel();
    await positionStream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettings>(
      builder: (context, state) {
        if (state.useKnots) {
          _speedConst = 1.944;
          _units = 'KTS';
        } else if (state.units == Units.Imperial) {
          _speedConst = 2.237;
          _units = 'MPH';
        } else {
          _speedConst = 3.6;
          _units = 'KPH';
        }
        if (_rawSpeed < 0) {
          _separationText = '--';
          _speed = '--';
        } else {
          if (state.units == Units.Imperial) {
            _separation = (state.smGroupDistance / (_rawSpeed * 3.28)).round();
          } else {
            _separation = (state.smGroupDistance / _rawSpeed).round();
          }
          if (_separation >= 99) {
            _separationText = '99';
          } else {
            _separationText = _separation.toString();
          }
          _speed = (_rawSpeed * _speedConst).round().toString();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                if (_separationText == '--' || _separation >= 99)
                  Text(
                    '+',
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Roboto Mono',
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                      fontFeatures: [
                        FontFeature.tabularFigures(),
                      ],
                    ),
                  ),
                Text(
                  _separationText,
                  style: TextStyle(
                    color: _separationText == '--' || _separation >= 99
                        ? Colors.red
                        : Colors.green,
                    fontFamily: 'Roboto Mono',
                    fontSize: 200,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -10,
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
                  ),
                ),
                Text(
                  'SEC',
                  style: TextStyle(
                    fontFamily: 'Roboto Mono',
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                Text(
                  _speed,
                  style: TextStyle(
                    color: _speed == '--'
                        ? Colors.red
                        : Theme.of(context).textTheme.bodyText1.color,
                    fontFamily: 'Roboto Mono',
                    fontSize: 75,
                    fontWeight: FontWeight.w700,
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
                  ),
                ),
                Text(
                  _units,
                  style: TextStyle(
                    fontFamily: 'Roboto Mono',
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    // fontFeatures: [
                    //   FontFeature.tabularFigures(),
                    // ],
                  ),
                ),
              ],
            ),
            // Text(_rawSpeed.toString()),
          ],
        );
      },
    );
  }
}
