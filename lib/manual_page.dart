import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ManualPage extends StatelessWidget {
  final double _defaultFontSize = 18.0;
  final double _defaultFontHeight = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual'),
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
                'An updated version of the manual is kept here:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize + 6,
                  height: _defaultFontHeight,
                ),
              ),
            ),
            InkWell(
              child: Text(
                'tinyurl.com/exitcount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize + 8,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => launch('tinyurl.com/exitcount'),
            ),
          ],
        ),
      ),
    );
  }
}
