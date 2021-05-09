import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'app_settings.dart';
import 'app_settings_cubit.dart';

class SpeedWidget extends StatefulWidget {
  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<SpeedWidget> {
  double _rawSpeed = -1;
  double _speedConst = 0;
  String _speed = '';
  String _units = '';
  int _separation = 0;
  String _separationText = '';

  late Timer timer;

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

  late StreamSubscription<Position> positionStream;
  late Position _position;
  void startTimer() {
    // if (serviceEnabled &&
    //     (permission == LocationPermission.always ||
    //         permission == LocationPermission.whileInUse)) {}

    positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 1,
    ).listen((Position position) {
      _position = position;
      setState(() {
        _rawSpeed = position.speed;
      });
    }, onError: (error) async {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        setState(() {
          _rawSpeed = -3;
        });
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          setState(() {
            _rawSpeed = -4;
          });
        }

        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          setState(() {
            _rawSpeed = -2;
          });
        }
      }
      // setState(() {
      //   _rawSpeed = -5;
      // });
      timer.cancel();
      startTimer(); // Restarts stream properly?
    });
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) async {
      Duration diff = DateTime.now().difference(_position.timestamp!);
      if (diff > Duration(seconds: 2)) {
        setState(() {
          _rawSpeed = -1;
        });
      }
    });
  }

  void stopTimer() async {
    timer.cancel();
    await positionStream.cancel();
  }

  void openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  void openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettings>(
      builder: (context, state) {
        if (_rawSpeed == -3) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  'Please enable location services on your device.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        } else if (_rawSpeed == -4) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  'GPS permissions have been denied forever for this app. Please change permissions for this app to work properly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        } else if (_rawSpeed == -2) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  'Please enable GPS permissions for the app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => {openAppSettings()},
                child: Text('Open Settings'),
              ),
              ElevatedButton(
                onPressed: () => {openLocationSettings()},
                child: Text('Open Location Services'),
              ),
            ],
          );
        } else if (_rawSpeed == -5) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  'An error occurred. Check permissions and location services are working properly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        } else {
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
              _separation =
                  (state.smGroupDistance / (_rawSpeed * 3.28)).round();
            } else {
              _separation = (state.smGroupDistance / _rawSpeed).round();
            }

            // _separation = 7; // un-comment to test

            if (_separation >= 99) {
              _separationText = '99';
            } else {
              _separationText = _separation.toString();
            }
            _speed = (_rawSpeed * _speedConst).round().toString();

            // _separationText = '--'; // un-comment to test
            // _speed = '108'; // un-comment to test
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AutoSizeText(
                'SECONDS BETWEEN GROUPS:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                minFontSize: 10,
                maxFontSize: 60,
                maxLines: 1,
              ),
              Divider(
                height: 16,
                thickness: 3,
                indent: 0,
                endIndent: 0,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (_separation >= 99)
                      Text(
                        '>',
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Roboto Mono',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
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
                        fontSize: 300,
                        fontWeight: FontWeight.bold,
                        height: .9,
                        letterSpacing: -20,
                        fontFeatures: [
                          FontFeature.tabularFigures(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 16,
                thickness: 3,
                indent: 0,
                endIndent: 0,
              ),
              Container(
                height: 70, // needed for vertical divider to show
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _speed,
                      style: TextStyle(
                        color: _speed == '--'
                            ? Colors.red
                            : Theme.of(context).textTheme.bodyText1!.color,
                        fontFamily: 'Roboto Mono',
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [
                          FontFeature.tabularFigures(),
                        ],
                        height: 0.9,
                      ),
                    ),
                    Text(
                      _units,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto Mono',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [
                          FontFeature.tabularFigures(),
                        ],
                        height: 0.9,
                      ),
                    ),
                    VerticalDivider(
                      width: 16,
                      thickness: 3,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.smGroupDistance.toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                height: 0.9,
                              ),
                            ),
                            Text(
                              state.units == Units.Imperial ? 'FT ' : 'M  ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Roboto Mono',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFeatures: [
                                  FontFeature.tabularFigures(),
                                ],
                                height: 0.9,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'SEPARATION',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
