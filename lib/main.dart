import 'package:flutter/material.dart';
import 'package:practice_desktop_app/config/app_router.dart';
import 'package:practice_desktop_app/state/login_bloc/login_bloc.dart';
import 'package:practice_desktop_app/view/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flavor_config.dart';

void mainCommon(AppConfig config) {
  runApp(
    MyApp(
      appName: config.appName,
      flavor: config.flavor,
      apiBaseUrl: config.apiBaseUrl,
    ),
  );
}

class MyApp extends StatelessWidget {
  final String appName;
  final String flavor;
  final String apiBaseUrl;

  const MyApp({
    super.key,
    required this.appName,
    required this.flavor,
    required this.apiBaseUrl,
  });

  @override
  Widget build(BuildContext context) {
    final AppRouters _appRouters = AppRouters();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      home: LoginScreen(),
      onGenerateRoute: _appRouters.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
