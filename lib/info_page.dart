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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Developer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _defaultFontSize + 4,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Placeholder(
                //replace with actual logo
                color: Colors.blueGrey,
                fallbackHeight: 75,
              ),
            ),
            Text(
              'www.benlussier.com',
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Text(
              'benlussier@live.com',
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Text(
              'github.com/BenLussier',
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Donate.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _defaultFontSize + 4,
                ),
              ),
            ),
            Text(
              'Venmo: @ben_lussier',
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Text(
              'PayPal: @benlussier',
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            Text(
              'Cash App: \$BenLussier',
              style: TextStyle(
                fontSize: _defaultFontSize,
                height: _defaultFontHeight,
              ),
            ),
            FlutterLogo(
              size: 150,
              style: FlutterLogoStyle.horizontal,
            ),
            Text(
              'Built with the Flutter™ SDK',
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
