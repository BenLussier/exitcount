import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_settings.dart';
import 'app_settings_cubit.dart';
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
          title: Text('ExitCount™'),
          backgroundColor: ThemeData.dark().primaryColor,
          centerTitle: false,
          actions: <Widget>[
            MoreMenu(),
          ]),
      body: BlocBuilder<AppSettingsCubit, AppSettings>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Text(state.topMsg),
                Expanded(
                  child: SpeedWidget(),
                ),
                Text(state.bottomMsg),
              ],
            ),
          );
        },
      ),
    );
  }
}
