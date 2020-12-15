import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// #TODO: This appears to crash app probably if permissions aren't granted
class SpeedWidget extends StatefulWidget {
  // const SpeedWidget({Key key}) : super(key: key);

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<SpeedWidget> {
  String _error;
  String _speed;

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
            desiredAccuracy: LocationAccuracy.high, distanceFilter: 1)
        .listen((Position position) {
      _position = position;
      // #TODO: handle speed = -1
      setState(() {
        _speed = position.speed.toString();
      });
    }, onError: (error) {
      // #TODO: Need to handle the stream being canceled.
      setState(() {
        _speed = 'error';
      });
    });
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) async {
      if (_position != null) {
        Duration diff = DateTime.now().difference(_position.timestamp);
        if (diff > Duration(seconds: 2)) {
          setState(() {
            _speed = '--';
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
    return Row(
      children: <Widget>[
        Text(
          // 'Timer Speed: ' + (_error ?? '${_locationData?.speed ?? "unknown"}'),
          'Speed: ' + (_error ?? _speed ?? 'unknown'),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
