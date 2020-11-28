import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

// #TODO: This appears to crash app probably if permissions aren't granted
class SpeedWidget extends StatefulWidget {
  // const SpeedWidget({Key key}) : super(key: key);

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<SpeedWidget> {
  final Location location = Location();

  LocationData _locationData;
  StreamSubscription<LocationData> _locationSubscription;
  String _error;

  Future<void> _getLocationData() async {
    setState(() {
      _error = null;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _locationData = _locationResult;
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
      });
    }
  }

  Future<void> _listenLocation() async {
    _locationSubscription =
        location.onLocationChanged.handleError((dynamic err) {
      setState(() {
        _error = err.code;
      });
      _locationSubscription.cancel();
    }).listen((LocationData currentLocation) {
      setState(() {
        _error = null;

        _locationData = currentLocation;
      });
    });
  }

  // Future<void> _stopListen() async {
  //   _locationSubscription.cancel();
  // }

  Timer timer;

  @override
  void initState() {
    super.initState();
    _listenLocation();
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _getLocationData());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // RaisedButton(
        //   child: Text('Get'),
        //   onPressed: _getLocationData,
        // ),
        Text(
          'Timer Speed: ' + (_error ?? '${_locationData?.speed ?? "unknown"}'),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
