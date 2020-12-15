import 'package:flutter/material.dart';
import 'more_menu.dart';
import 'speed.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ThemeData.dark().primaryColor,
          centerTitle: false,
          title: Text('ExitCount™'),
          actions: <Widget>[
            MoreMenu(),
          ]),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(children: <Widget>[
          SpeedWidget(),
        ]),
      ),
    );
  }
}
