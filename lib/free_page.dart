import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FreePage extends StatelessWidget {
  final double _defaultFontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Always Free.'),
        backgroundColor: ThemeData.dark().primaryColor,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Always Free.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _defaultFontSize + 4,
                ),
              ),
            ),
            Text(
              "This app will always be 100% free. No purchase price. No pesky ads. This is because of our sponsors' generous donations.",
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
    );
  }
}
