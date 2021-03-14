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
              'This app will always be free. However, if you find this app especially helpful or saves your dropzone money, please consider donating:',
              textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
