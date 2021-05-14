import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'app_settings.dart';
import 'app_settings_cubit.dart';
import 'more_menu.dart';
import 'speed.dart';

class MyHomePage extends StatefulWidget {
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
                // Expanded(
                //   flex: 5,
                //   child: SpeedWidget(),
                // ),
                SpeedWidget(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // TOP MESSAGE
                      AutoSizeText(
                        state.topMsg,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                        ),
                        minFontSize: 10,
                        maxFontSize: 100,
                        maxLines: 4,
                      ),
                      Divider(
                        height: 32,
                        thickness: 3,
                        indent: 0,
                        endIndent: 0,
                      ),
                      // BOT MESSAGE
                      AutoSizeText(
                        state.bottomMsg,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 60,
                          fontWeight: FontWeight.w700,
                        ),
                        minFontSize: 10,
                        maxFontSize: 100,
                        maxLines: 4,
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
