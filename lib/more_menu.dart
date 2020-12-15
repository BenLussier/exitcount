import 'package:flutter/material.dart';

enum MenuItem { settings, info }

class MoreMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItem>(
      icon: Icon(Icons.more_vert),
      onSelected: (MenuItem value) {
        switch (value) {
          case MenuItem.settings:
            Navigator.of(context).pushNamed('/settings');
            break;
          case MenuItem.info:
            Navigator.of(context).pushNamed('/settings');
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
        const PopupMenuItem<MenuItem>(
          value: MenuItem.settings,
          child: Text('Settings'),
        ),
        const PopupMenuItem<MenuItem>(
          value: MenuItem.info,
          child: Text('Info'),
        )
      ],
    );
  }
}
