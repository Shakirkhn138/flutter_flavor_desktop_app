

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_desktop_app/view/analytics_screen.dart';
import 'package:practice_desktop_app/view/customer_screen.dart';
import 'package:practice_desktop_app/view/dashboard_screen.dart';
import 'package:practice_desktop_app/view/login_screen.dart';
import 'package:practice_desktop_app/view/menu_screen.dart';
import 'package:practice_desktop_app/view/orders_screen.dart';
import 'package:practice_desktop_app/view/setting_screen.dart';
import 'package:practice_desktop_app/view/singup_screen.dart';

class AppRouters {
  Route onGenerateRoute(RouteSettings setting){
    switch (setting.name){
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'signup':
        return MaterialPageRoute(builder: (_) => SingUpScreen());
      case 'dashboard':
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case 'menu':
        return MaterialPageRoute(builder: (_) => MenuScreen());
      case 'customer':
        return MaterialPageRoute(builder: (_) => CustomerScreen());
      case 'analytics':
        return MaterialPageRoute(builder: (_) => AnalyticsScreen());
      case 'order':
        return MaterialPageRoute(builder: (_) => OrdersScreen());
      case 'setting':
        return MaterialPageRoute(builder: (_) => SettingScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}