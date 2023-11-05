import 'package:chat_app/common/assets_manager.dart';
import 'package:chat_app/common/size_manager.dart';
import 'package:chat_app/features/03_login/presentation/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/string_manager.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
 final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => _loginBloc..add(LoginScreenAnimate()),
  child: BlocBuilder<LoginBloc, LoginState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(StringManager.appTitle,)
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
             top: SizeManager.h(context) * 0.2,
              left: state is LoginBringAnimation? SizeManager.w(context) * 0.3: -(SizeManager.w(context) * 0.9) ,
              child: SizedBox(
            width: SizeManager.w(context) * 0.4,
            child: Text(StringManager.welcomeTitle, maxLines: 2, style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold, fontSize: SizeManager.h(context) * 0.03,color: Colors.deepPurple,),),
          ),),
          Positioned(

              top: SizeManager.h(context) * 0.5,
              left: SizeManager.w(context) * 0.1,
              width: SizeManager.w(context) * 0.8,
              height: SizeManager.h(context) * 0.07,
              child: ElevatedButton.icon
                (
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade100,
                  shape: const StadiumBorder()
                ),
                  onPressed: (){
                  _loginBloc.add(LoginViaGoogle());
                  }, icon: Image.asset(AssetsManager.loginGoogleImage, height: SizeManager.h(context) * 0.04),
                  label: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Sign in with ', style:GoogleFonts.robotoSlab(color:
                        Colors.deepPurple, fontSize: SizeManager.h(context) * 0.02, fontWeight: FontWeight.normal)),
                        TextSpan(text: 'Google', style:GoogleFonts.robotoSlab(color:
                        Colors.deepPurple, fontSize: SizeManager.h(context) * 0.02, fontWeight: FontWeight.bold) )
                      ]
                    ),
                  )))
        ],
      ),
    );
  },
),
);
  }
}
