import 'package:flutter/material.dart';

enum MenuItem { settings, manual, info, free, problem }

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
          case MenuItem.manual:
            Navigator.of(context).pushNamed('/manual');
            break;
          case MenuItem.info:
            Navigator.of(context).pushNamed('/info');
            break;
          case MenuItem.free:
            Navigator.of(context).pushNamed('/free');
            break;
          case MenuItem.problem:
            Navigator.of(context).pushNamed('/problem');
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
        const PopupMenuItem<MenuItem>(
          value: MenuItem.settings,
          child: Text('Settings'),
        ),
        const PopupMenuItem<MenuItem>(
          value: MenuItem.manual,
          child: Text('Manual'),
        ),
        const PopupMenuItem<MenuItem>(
          value: MenuItem.info,
          child: Text('App Info'),
        ),
        const PopupMenuItem<MenuItem>(
          value: MenuItem.free,
          child: Text('Always Free'),
        ),
        const PopupMenuItem<MenuItem>(
          value: MenuItem.problem,
          child: Text('Report Problem'),
        ),
      ],
    );
  }
}
