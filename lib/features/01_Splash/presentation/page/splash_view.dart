import 'package:chat_app/common/assets_manager.dart';
import 'package:chat_app/common/size_manager.dart';
import 'package:chat_app/features/01_Splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/string_manager.dart';

class SplashView extends StatelessWidget {
   SplashView({super.key});

  final SplashBloc _splashBloc = SplashBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => _splashBloc..add(BringSplashScreen(context: context)),
  child: BlocBuilder<SplashBloc, SplashState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AssetsManager.splashImage,             height: SizeManager.h(context) * 0.3,
              width: SizeManager.w(context) * 0.9,),
          ),
          Text(StringManager.appTitle, style: GoogleFonts.robotoSlab(color: Colors.deepPurple.shade900, fontSize: SizeManager.h(context) * 0.04,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  },
),
);
  }
}
