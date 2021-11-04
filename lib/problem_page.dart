import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProblemPage extends StatelessWidget {
  final double _defaultFontSize = 18.0;
  final double _defaultFontHeight = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Problem'),
        backgroundColor: ThemeData.dark().primaryColor,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'To report a problem with the app, please contact us at the email address below:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize + 6,
                  height: _defaultFontHeight,
                ),
              ),
            ),
            InkWell(
              child: Text(
                'ExitCountApp@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize + 8,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => launch('mailto:exitcountapp@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }
}
