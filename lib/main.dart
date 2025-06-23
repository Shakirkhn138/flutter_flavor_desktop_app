// import 'package:flutter/material.dart';
// import 'package:practice_desktop_app/config/app_router.dart';
// import 'package:practice_desktop_app/state/login_bloc/login_bloc.dart';
// import 'package:practice_desktop_app/view/login_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'flavor_config.dart';
//
// void mainCommon(AppConfig config) {
//   runApp(
//     MyApp(
//       appName: config.appName,
//       flavor: config.flavor,
//       apiBaseUrl: config.apiBaseUrl,
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   final String appName;
//   final String flavor;
//   final String apiBaseUrl;
//
//   const MyApp({
//     super.key,
//     required this.appName,
//     required this.flavor,
//     required this.apiBaseUrl,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final AppRouters _appRouters = AppRouters();
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: appName,
//
//       home: LoginScreen(),
//       onGenerateRoute: _appRouters.onGenerateRoute,
//       initialRoute: '/',
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'package:practice_desktop_app/config/app_router.dart';
import 'package:practice_desktop_app/view/login_screen.dart';
import 'flavor_config.dart';

void mainCommon(AppConfig config) {
  WidgetsFlutterBinding.ensureInitialized();

  doWhenWindowReady(() {
    const initialSize = Size(1200, 800);
    appWindow.minSize = Size(600, 400);
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = config.appName;
    appWindow.show();
  });

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
    final AppRouters appRouters = AppRouters();

    return WindowBorder(
      color: const Color(0xFFCCCCCC),
      width: 1,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        home: const LoginScreen(),
        onGenerateRoute: appRouters.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
