import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonatePage extends StatelessWidget {
  final double _defaultFontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
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
            Text(
              "If you would like to donate or sponsor the app, please contact us:",
              textAlign: TextAlign.center,
            ),
            InkWell(
              child: Text(
                'ExitCountApp@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _defaultFontSize,
                  height: 1.5,
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
