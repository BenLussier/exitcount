import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  final double _defaultFontSize = 18.0;
  final double _defaultFontHeight = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Info'),
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
              child: FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.6,
                child: Image.asset(
                  'logos/ExitCountWordLogo_Trans.png',
                ),
              ),
            ),
            Text(
              'Version: 1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text(
                'Sponsors.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _defaultFontSize + 4,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'This app is 100% free thanks to the generous support of our sponsors.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize,
                  height: _defaultFontHeight,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.5,
                child: Image.asset(
                  'logos/SkydiveUtahLogo.png',
                ),
              ),
            ),
            InkWell(
              child: Text(
                'www.skydiveutah.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () => launch('https://www.skydiveutah.com'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text(
                'Developer.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _defaultFontSize + 4,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.25,
                child: Image.asset(
                  'logos/BenLussierLogo_BluGrn_RGB.png',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: InkWell(
                child: Text(
                  'www.benlussier.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _defaultFontSize,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () => launch('https://www.benlussier.com'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'benlussier@live.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize,
                  height: _defaultFontHeight,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'github.com/BenLussier',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize,
                  height: _defaultFontHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
