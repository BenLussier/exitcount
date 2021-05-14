import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_settings.dart';
import 'app_settings_cubit.dart';

class SettingsPage extends StatefulWidget {
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
                    Text('Separation: '),
                    Text(
                      state.smGroupDistance.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      state.units == Units.Imperial ? ' ft' : ' m',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter group separation in ' +
                              (state.units == Units.Imperial
                                  ? 'feet:'
                                  : 'meters:')),
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
                title: Row(
                  children: [
                    Text("Units: "),
                    Text(
                      state.units == Units.Imperial ? 'Imperial' : 'Metric',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                children: [
                  RadioListTile<Units>(
                    title: const Text('Imperial (ft, mph)'),
                    value: Units.Imperial,
                    groupValue: state.units,
                    onChanged: (Units? value) {
                      setState(() {
                        context.read<AppSettingsCubit>().setUnits(value);
                      });
                    },
                  ),
                  RadioListTile<Units>(
                    title: const Text('Metric (m, kph)'),
                    value: Units.Metric,
                    groupValue: state.units,
                    onChanged: (Units? value) {
                      setState(() {
                        context.read<AppSettingsCubit>().setUnits(value);
                      });
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
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Use knots: '),
                        Text(
                          state.useKnots ? 'Yes' : 'No',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text('Display speed in knots instead of ' +
                        (state.units == Units.Imperial ? 'mph' : 'kph')),
                  ],
                ),
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
                title: Text('1st Message'),
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Enter 1st message:'),
                      initialValue: state.topMsg,
                      autofocus: true,
                      onChanged: (input) {
                        context.read<AppSettingsCubit>().setTopMsg(input);
                      },
                    ),
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
                title: Text('2nd Message'),
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Enter 2nd message:'),
                      initialValue: state.middleMsg,
                      autofocus: true,
                      onChanged: (input) {
                        context.read<AppSettingsCubit>().setMiddleMsg(input);
                      },
                    ),
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
                title: Text('3rd Message'),
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Enter 3rd message:'),
                      initialValue: state.bottomMsg,
                      autofocus: true,
                      onChanged: (input) {
                        context.read<AppSettingsCubit>().setBottomMsg(input);
                      },
                    ),
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
