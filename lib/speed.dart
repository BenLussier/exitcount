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
  String _separation;

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
          _separation = '--';
          _speed = '--';
        } else {
          if (state.units == Units.Imperial) {
            _separation =
                (state.smGroupDistance / (_rawSpeed * 3.28)).round().toString();
          } else {
            _separation =
                (state.smGroupDistance / _rawSpeed).round().toString();
          }
          _speed = (_rawSpeed * _speedConst).round().toString();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  _separation,
                  style: TextStyle(
                    color: _separation == '--' ? Colors.red : Colors.green,
                    fontSize: 150,
                    fontWeight: FontWeight.bold,
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
                  ),
                ),
                Text(
                  'SEC',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  _speed,
                  style: TextStyle(
                    color: _speed == '--' ? Colors.red : Colors.green,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
                  ),
                ),
                Text(
                  _units,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFeatures: [
                      FontFeature.tabularFigures(),
                    ],
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
