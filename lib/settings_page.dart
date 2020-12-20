import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_settings.dart';
import 'app_settings_cubit.dart';

class SettingsPage extends StatefulWidget {
  // const SpeedWidget({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: ThemeData.dark().primaryColor,
        centerTitle: false,
      ),
      body: BlocBuilder<AppSettingsCubit, AppSettings>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              ExpansionTile(
                title: Text(
                    'Separation Distance: ' + state.smGroupDistance.toString()),
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "Enter your number"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    initialValue: state.smGroupDistance.toString(),
                    autofocus: true,
                    onChanged: (input) {
                      context
                          .read<AppSettingsCubit>()
                          .setSmGroupDistance(int.parse(input));
                    },
                  ),
                ],
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
            ],
          );
        },
      ),
    );
  }
}
