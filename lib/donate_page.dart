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
              "This app will always be 100% free. No purchase price. No pesky ads. This is because of our sponsors' generous donations to cover minimum operating costs for several years. However, more money will always be helpful to develop the app further. If you find this app especially helpful or saves your dropzone money, please consider donating:",
              textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
