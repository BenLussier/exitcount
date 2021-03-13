import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: AutoSizeText(
                          state.topMsg,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 60,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SpeedWidget(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: AutoSizeText(
                          state.bottomMsg,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 60,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
