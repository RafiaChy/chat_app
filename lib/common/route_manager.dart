
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/01_Splash/presentation/page/splash_view.dart';
import '../features/02_Home/presentation/page/home_view.dart';
import '../features/03_login/presentation/page/login_view.dart';

class RouteNames{
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
}
class RouteManager {
   static Route<dynamic> getRoute(RouteSettings routeSettings) {

    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteNames.splashRoute:
        return MaterialPageRoute(builder: (_) =>   SplashView());
      case RouteNames.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RouteNames.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginView());



      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('Chat App'),
          ),
          body: const Center(
            child: Text('No Route Found'),
          ),
        ));
  }
}