import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  final double _defaultFontSize = 18.0;
  final double _defaultFontHeight = 1.5;
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
            Text(
              "ExitCountApp@gmail.com",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
