import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:wakelock/wakelock.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_settings.dart';
import 'app_settings_cubit.dart';
import 'more_menu.dart';
import 'speed.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _showWarningDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'WARNING!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'Using this app incorrectly could result in injury or death. Use this app at your own risk!',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                const Text(
                  'Before using this app for skydiving operations, you MUST agree to the following:',
                  textAlign: TextAlign.left,
                ),
                const Text(
                  '• I have read and understand the entirety of the Manual.',
                  textAlign: TextAlign.left,
                ),
                const Text(
                  '• I have performed the section in the Manual titled, “VALIDATING THE APP”.',
                  textAlign: TextAlign.left,
                ),
                const Text(
                  '• I have installed the app in the plane in a safe and legal manner.',
                  textAlign: TextAlign.left,
                ),
                const Text(
                  '• I have communicated the information from the section in the Manual titled, “RISKS AND WARNINGS TO COMMUNICATE” to all persons using the app.',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("I Agree."),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSponsorDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            '100% Free.',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'Thanks to our sponsors:',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Image.asset(
                      'logos/SkydiveUtahLogo.png',
                    ),
                  ),
                ),
                InkWell(
                  child: const Text(
                    'www.skydiveutah.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () => launch('https://www.skydiveutah.com'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Got it!"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Wakelock.enable(); // keep screen on
    Future.delayed(Duration.zero, () => _showSponsorDialog(context));
    Future.delayed(
        Duration.zero, () => _showWarningDialog(context)); // so is on top
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
                SpeedWidget(),
                if (state.topMsg != '')
                  // TOP MSG
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: AutoSizeText(
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
                    ),
                  ),
                if (state.topMsg != '')
                  Divider(
                    height: 32,
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                  ),
                if (state.middleMsg != '')
                  // MID MSG
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: AutoSizeText(
                        state.middleMsg,
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
                    ),
                  ),
                if (state.bottomMsg != '')
                  Divider(
                    height: 32,
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                  ),
                if (state.bottomMsg != '')
                  // BOT MSG
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: AutoSizeText(
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
