import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: 'Section',
              tiles: [
                SettingsTile(
                  title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language),
                  onPressed: (BuildContext context) {},
                ),
                // SettingsTile.switchTile(
                //   title: 'Use fingerprint',
                //   leading: Icon(Icons.fingerprint),
                //   switchValue: value,
                //   onToggle: (bool value) {},
                // ),
              ],
            ),
          ],
        ));
  }
}

// class _SettingsState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: BlocBuilder<AppSettingsCubit, AppSettings>(
//           builder: (BuildContext context, AppSettings state) {
//         return SettingsList(
//           sections: [
//             SettingsSection(
//               title: 'Section',
//               tiles: [
//                 SettingsTile(
//                   title: 'Group Separation Distance',
//                   subtitle: '$state.smGroupDistance',
//                   leading: Icon(Icons.language),
//                   onPressed: (BuildContext context) {},
//                 ),
//                 // SettingsTile.switchTile(
//                 //   title: 'Use fingerprint',
//                 //   leading: Icon(Icons.fingerprint),
//                 //   switchValue: value,
//                 //   onToggle: (bool value) {},
//                 // ),
//               ],
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
