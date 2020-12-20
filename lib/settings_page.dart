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
            children: [
              ExpansionTile(
                title: Row(
                  children: [
                    Text(state.smGroupDistance.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("' Separation"),
                  ],
                ),
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter group separation in feet:'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
              SwitchListTile(
                title: Text('Use Knots'),
                value: state.useKnots,
                onChanged: (value) {
                  context.read<AppSettingsCubit>().setUseKnots(value);
                },
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              ExpansionTile(
                title: Text('Top Message'),
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter top message:'),
                    initialValue: state.topMsg,
                    autofocus: true,
                    onChanged: (input) {
                      context.read<AppSettingsCubit>().setTopMsg(input);
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
              ExpansionTile(
                title: Text('Bottom Message'),
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter bottom message:'),
                    initialValue: state.bottomMsg,
                    autofocus: true,
                    onChanged: (input) {
                      context.read<AppSettingsCubit>().setBottomMsg(input);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
