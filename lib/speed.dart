import 'dart:async';
// import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

// #TODO: This appears to crash app probably if permissions aren't granted
class SpeedWidget extends StatefulWidget {
  // const SpeedWidget({Key key}) : super(key: key);

  @override
  _SpeedState createState() => _SpeedState();
}

class _SpeedState extends State<SpeedWidget> {
  // final Location location = Location();

  // bool _serviceEnabled;
  // PermissionStatus _permissionGranted;
  // LocationData _locationData;
  // StreamSubscription<LocationData> _locationSubscription;
  String _error;
  String _speed;

  // Future<String> _getLocationData() async {
  //   try {
  //     _serviceEnabled = await location.serviceEnabled();
  //     if (!_serviceEnabled) {
  //       _serviceEnabled = await location.requestService();
  //       if (!_serviceEnabled) {
  //         // setState(() {
  //         //   _error = 'Service not enabled.';
  //         // });
  //         return 'Service not enabled';
  //       }
  //     }

  //     _permissionGranted = await location.hasPermission();
  //     if (_permissionGranted == PermissionStatus.denied) {
  //       _permissionGranted = await location.requestPermission();
  //       if (_permissionGranted != PermissionStatus.granted) {
  //         // setState(() {
  //         //   _error = 'Location not enabled.';

  //         // });
  //         return 'Location not enabled';
  //       }
  //     }

  //     final LocationData _locationResult = await location.getLocation();
  //     // setState(() {
  //     //   _error = null;
  //     //   _locationData = _locationResult;
  //     // });
  //     return _locationResult.speed.toString();
  //   } on PlatformException catch (err) {
  //     // setState(() {
  //     //   _error = err.code;
  //     // });
  //     return err.code.toString();
  //   }
  // }

  // Future<void> _listenLocation() async {
  //   _locationSubscription =
  //       location.onLocationChanged.handleError((dynamic err) {
  //     setState(() {
  //       _error = err.code;
  //     });
  //     _locationSubscription.cancel();
  //   }).listen((LocationData currentLocation) {
  //     setState(() {
  //       _error = null;

  //       _locationData = currentLocation;
  //     });
  //   });
  // }

  // Future<void> _stopListen() async {
  //   _locationSubscription.cancel();
  // }

  Timer timer;

  @override
  void initState() {
    super.initState();
    // _listenLocation();
    startTimer();
  }

  @override
  void dispose() {
    // _stopListen();
    stopTimer();
    super.dispose();
  }

  StreamSubscription<Position> positionStream;
  Position _position;
  void startTimer() {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      // print(position == null
      //     ? 'Unknown'
      //     : position.latitude.toString() +
      //         ', ' +
      //         position.longitude.toString());
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
      // String _result = '';
      // _result =
      //     await _getLocationData().timeout(Duration(seconds: 2), onTimeout: () {
      //   // setState(() {
      //   //   _error = '--';
      //   // });
      //   return '--';
      // });
      // Random r = new Random();
      // _result = r.nextInt(100).toString();
      Duration diff = DateTime.now().difference(_position.timestamp);
      if (diff > Duration(seconds: 2)) {
        setState(() {
          _speed = '--';
        });
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
