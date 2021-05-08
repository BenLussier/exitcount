import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:path_provider/path_provider.dart';

import 'app_settings_cubit.dart';

import 'home_page.dart';
import 'settings_page.dart';
import 'info_page.dart';
import 'donate_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // protect calls before runApp()
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // force portrait mode
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppSettingsCubit(),
      child: MaterialApp(
        title: 'ExitCount™',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        darkTheme: ThemeData.dark(),
        routes: {
          '/': (context) => MyHomePage(),
          '/settings': (context) => SettingsPage(),
          '/info': (context) => InfoPage(),
          '/donate': (context) => DonatePage(),
        },
        builder: (context, widget) => ResponsiveWrapper.builder(
          widget!,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(
            color: Color(0xFFF5F5F5),
          ),
        ),
      ),
    );
  }
}
