import 'package:chat_app/common/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_configurations/app_environments.dart';
import 'common/size_manager.dart';

void  mainDelegateForEnvironments() {
  runApp( RootApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class RootApp extends StatefulWidget {
  const RootApp._internal();

  static const RootApp instance = RootApp._internal();

  factory RootApp() => instance;

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
           iconTheme:  IconThemeData(color:Colors.purple.shade300,),
          titleTextStyle:GoogleFonts.robotoSlab(color: Colors.purple.shade300, fontWeight: FontWeight.bold, fontSize: SizeManager.h(context) * 0.024)
        ),

      ),
      debugShowCheckedModeBanner: AppEnvironments.debugBannerBoolean,
      initialRoute: RouteNames.splashRoute,
      onGenerateRoute: RouteManager.getRoute,
      title: AppEnvironments.appName,
      navigatorKey: navigatorKey,


    );
  }
}
