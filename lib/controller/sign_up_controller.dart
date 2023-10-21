import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../widgets/flutter_toast.dart';
import '../pages/sign_up/bloc/sign_up_bloc.dart';

class SignUpController {
  final BuildContext context;
  const SignUpController({required this.context});

  Future<void> handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    String userName = state.userNameInitial;
    String email = state.emailInitial;
    String password = state.passwordInitial;
    String rePassword = state.rePasswordInitial;

    try {
      if (userName.isEmpty) {
        toastInfo(message: "you need to fill name");
        return;
      }
      if (email.isEmpty) {
        toastInfo(message: "you need to fill email address");
        return;
      }
      if (password.isEmpty) {
        toastInfo(message: "you need to fill password");
        return;
      }
      if (rePassword.isEmpty) {
        toastInfo(message: "wrong password");
        return;
      }
      if (password.isNotEmpty) {
        if (password.length < 8) {
          toastInfo(message: "your password must bigger than 7 letters");
          return;
        }
      }
      if (password != rePassword) {
        toastInfo(message: "Password are not identical, try again");
      }

      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        var user = credential.user;
        print(user!.email);
        if (user == null) {
          toastInfo(message: "Currently you are not a user of this app");
          return;
        }
        if (!user.emailVerified) {
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(userName);
          toastInfo(message: "An email has been sent to your registered email.To activate it please click here");
          Navigator.of(context).pop();
          return;
        }

      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          toastInfo(message: "email already in use");
        } else if (e.code == 'weak-password') {
          toastInfo(message: "your password provided is week!! try again");
        } else if (e.code == 'invalid-email') {
          toastInfo(message: "your email address format is wrong");
        }
      }
    } catch (e) {}
  }
}
