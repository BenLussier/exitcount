import 'package:flutter/material.dart';

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
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Version: 1.0.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize,
                  height: _defaultFontHeight,
                ),
              ),
            ),
            Text(
              'Developer.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _defaultFontSize + 4,
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
            Text(
              'www.benlussier.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Text(
              'benlussier@live.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Text(
              'github.com/BenLussier',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Donate.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _defaultFontSize + 4,
                ),
              ),
            ),
            Text(
              'Venmo: @ben_lussier',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Text(
              'PayPal: @benlussier',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Text(
              'Cash App: \$BenLussier',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 0.5,
              child: FlutterLogo(
                size: 150,
                style: FlutterLogoStyle.horizontal,
              ),
            ),
            Text(
              'Built with the Flutter™ SDK',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: _defaultFontSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}
