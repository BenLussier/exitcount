import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        backgroundColor: ThemeData.dark().primaryColor,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text('Developed by:'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Ben Lussier',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Text('www.benlussier.com'),
            Text('benlussier@live.com'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Always free.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'This app will always be free. However, if you find this app especially helpful or saves your dropzone money, please consider donating:',
              textAlign: TextAlign.center,
            ),
            Text('Venmo: @ben_lussier'),
            Text('PayPal: @benlussier'),
            Text('Cash App: \$BenLussier'),
          ],
        ),
      ),
    );
  }
}
