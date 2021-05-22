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
    startStream();
  }

  @override
  void dispose() {
    stopAll();
    super.dispose();
  }

  late StreamSubscription<Position> positionStream;
  late Position _position;
  void startStream() {
    positionStream = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 1,
    ).listen((Position position) {
      _position = position;
      startTimer(); // now that _position is initialized
      setState(() {
        _rawSpeed = position.speed;
      });
    }, onError: (error) async {
      bool serviceEnabled;
      LocationPermission permission;
      double _tempRawSpeed = -5;
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        _tempRawSpeed = -2;
      }
      // Test if permissions are set correctly.
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _rawSpeed = _tempRawSpeed;
        });
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          _tempRawSpeed = -3;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        _tempRawSpeed = -4;
      }
      setState(() {
        _rawSpeed = _tempRawSpeed;
      });
      timer.cancel();
      startStream(); // Restarts stream properly?
    });
  }

  void startTimer() async {
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) async {
      Duration diff = DateTime.now().difference(_position.timestamp!);
      if (diff > Duration(seconds: 2)) {
        setState(() {
          _rawSpeed = -1;
        });
      }
    });
  }

  void stopAll() async {
    timer.cancel();
    await positionStream.cancel();
  }

  void openDeviceSettings() async {
    await Geolocator.openAppSettings();
  }

  void openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettings>(
      builder: (context, state) {
        _rawSpeed = -2; //uncomment to test
        if (_rawSpeed == -2) {
          // LOCATION SERVICES ARE NOT ENABLED
          return AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: AutoSizeText(
                    'Please enable location services on your device.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 10,
                    maxFontSize: 100,
                    maxLines: 2,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {openLocationSettings()},
                  child: Text('Open Location Services'),
                ),
                Divider(
                  height: 32,
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
          );
        } else if (_rawSpeed == -3) {
          // JUST DENIED
          return AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: AutoSizeText(
                    'Please enable GPS permissions for the app.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 10,
                    maxFontSize: 100,
                    maxLines: 2,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {openDeviceSettings()},
                  child: Text('Open Device Settings'),
                ),
                Divider(
                  height: 32,
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
          );
        } else if (_rawSpeed == -4) {
          // DENIED FOREVER
          return AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: AutoSizeText(
                    'GPS permissions have been denied forever for this app. Please change permissions for this app to work properly.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 10,
                    maxFontSize: 100,
                    maxLines: 4,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {openDeviceSettings()},
                  child: Text('Open Device Settings'),
                ),
                Divider(
                  height: 32,
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
          );
        } else if (_rawSpeed == -5) {
          // UNKNOWN ERROR
          return AspectRatio(
            aspectRatio: 3 / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: AutoSizeText(
                    'An unknown error occurred. Check permissions and location services are working properly.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 10,
                    maxFontSize: 100,
                    maxLines: 2,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {openLocationSettings()},
                  child: Text('Open Location Services'),
                ),
                ElevatedButton(
                  onPressed: () => {openDeviceSettings()},
                  child: Text('Open Device Settings'),
                ),
                Divider(
                  height: 32,
                  thickness: 3,
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            ),
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
          if (_rawSpeed <= 0) {
            _separation = 0;
            _separationText = '--';
            _speed = '--';
          } else {
            if (state.units == Units.Imperial) {
              _separation = (state.smGroupDistance / (_rawSpeed * 3.28)).ceil();
            } else {
              _separation = (state.smGroupDistance / _rawSpeed).ceil();
            }
            // _separation = 100; // un-comment to test

            if (_separation >= 99) {
              _separationText = '99';
            } else {
              _separationText = _separation.toString();
            }
            // _separationText = '99'; // un-comment to test

            _speed = (_rawSpeed * _speedConst).round().toString();
            // _speed = '208'; // un-comment to test
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // SECONDS BETWEEN GROUPS:
              Container(
                child: AutoSizeText(
                  'SECONDS BETWEEN GROUPS:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  minFontSize: 10,
                  maxFontSize: 60,
                  maxLines: 1,
                ),
              ),
              Divider(
                height: 32,
                thickness: 3,
                indent: 0,
                endIndent: 0,
              ),
              // > SEC
              Container(
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // >
                      Expanded(
                        flex: 1,
                        child: AutoSizeText(
                          _separation >= 99 ? '>' : ' ',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'DMMono',
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 10,
                          maxFontSize: 50,
                          maxLines: 1,
                        ),
                      ),
                      // SEC
                      Expanded(
                        flex: 5,
                        child: AutoSizeText(
                          _separationText,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: _separationText == '--' || _separation >= 99
                                ? Colors.red
                                : Colors.green,
                            fontFamily: 'DMMono',
                            fontSize: 600,
                          ),
                          minFontSize: 100,
                          maxFontSize: 600,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 32,
                thickness: 3,
                indent: 0,
                endIndent: 0,
              ),
              // SPEED KTS | DIST' SEPARATION
              Container(
                child: AspectRatio(
                  aspectRatio: 6 / 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 4 / 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // SPEED
                            AutoSizeText(
                              _speed,
                              style: TextStyle(
                                color: _speed == '--'
                                    ? Colors.red
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                fontFamily: 'DMMono',
                                fontSize: 300,
                              ),
                              minFontSize: 10,
                              maxFontSize: 300,
                              maxLines: 1,
                            ),
                            // KTS
                            FractionallySizedBox(
                              alignment: Alignment.center,
                              heightFactor: 0.4,
                              child: AutoSizeText(
                                _units,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'DMMono',
                                  fontSize: 300,
                                ),
                                minFontSize: 10,
                                maxFontSize: 300,
                              ),
                            ),
                            VerticalDivider(
                              width: 32,
                              thickness: 3,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ],
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 2 / 1,
                        child: AutoSizeText(
                          state.smGroupDistance.toString() +
                              (state.units == Units.Imperial ? "'" : 'm'),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 300,
                            fontWeight: FontWeight.w600,
                            height: 0.9,
                          ),
                          minFontSize: 10,
                          maxFontSize: 300,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 32,
                thickness: 3,
                indent: 0,
                endIndent: 0,
              ),
            ],
          );
        }
      },
    );
  }
}
