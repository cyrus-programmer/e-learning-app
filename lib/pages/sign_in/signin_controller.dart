import 'package:e_learning_app/common/widgets/flutter_toast.dart';
import 'package:e_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signin_state.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        final emailAddress = state.email;
        final password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "Please enter your email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Please enter your Password");
          return;
        }
        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credentials.user == null) {
            toastInfo(msg: "User doesn't exist");
            return;
          }
          if (!credentials.user!.emailVerified) {
            toastInfo(msg: "Email address not verified");
            return;
          }
          var user = credentials.user;
          if (user != null) {
            // we are login successfully
            debugPrint("User exists");
          } else {
            //Unable to login through firebase
            debugPrint("User doesn't exist");
            toastInfo(msg: "User doesn't exist");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            debugPrint("No user found for that email");
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            debugPrint("Wrong password");
            toastInfo(msg: "Wrong password");
          }
        }
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
