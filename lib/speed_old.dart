import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class SpeedWidget extends StatefulWidget {
  // const SpeedWidget({Key key}) : super(key: key);

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<SpeedWidget> {
  final Location location = Location();

  LocationData _locationData;
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

  Timer timer;

  @override
  void initState() {
    super.initState();
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
