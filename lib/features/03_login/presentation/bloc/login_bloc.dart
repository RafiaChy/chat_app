import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:chat_app/common/route_manager.dart';
import 'package:chat_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../services/social_sign_in_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginScreenAnimate>(_onLoginScreenAnimate);
    on<LoginViaGoogle>(_onLoginViaGoogle);

  }

  Future<FutureOr<void>> _onLoginScreenAnimate(LoginScreenAnimate event, Emitter<LoginState> emit) async {
   await Future.delayed(const Duration(microseconds: 500,), (){emit(LoginBringAnimation());});
  }

  FutureOr<void> _onLoginViaGoogle(LoginViaGoogle event, Emitter<LoginState> emit) async {
    BuildContext context = navigatorKey.currentState!.context; // Capture the context
    emit(LoginLoading());

    try {
      UserCredential? userCredential = await SocialSignInServices.signInWithGoogle();
      print('hey $userCredential');
      //https://firebase.google.com/codelabs/firebase-auth-in-flutter-apps#0
      //https://pub.dev/packages/google_sign_in
      //https://firebase.google.com/docs/auth/flutter/federated-auth

      if(userCredential != null) {
        //Use these if necessary.
        //Note: more properties are available.
        String googleUserDisplayName = userCredential.user?.displayName ?? '';
        String googleUserPhotoUrl = userCredential.user?.photoURL ?? '';
        String googleUserEmail = userCredential.user?.email ?? '';
        String googleUserPhoneNumber = userCredential.user?.phoneNumber ?? '';
        bool googleUserEmailVerified = userCredential.user?.emailVerified ?? false;
        bool googleUserAnonymous = userCredential.user?.isAnonymous ?? false;
        String googleUserUid = userCredential.user?.uid ?? '';
        String googleUserTenantId = userCredential.user?.tenantId ?? '';
        String googleUserRefreshToken = userCredential.user?.refreshToken ?? '';

        emit(LoginSuccess(message: 'Success'));


        if(context.mounted)  {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.homeRoute,
                (route) => false,
          );
        }
      }
      else{
        print('hey $userCredential');
        if(context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(

              const SnackBar(content: Text('Null'),)

          );
        }
        LoginFail(message: 'Null');
      }
    } catch (e) {
      LoginFail(message: e.toString());
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(

          SnackBar(content: Text(e.toString()),)

      );
    }
  }
}
