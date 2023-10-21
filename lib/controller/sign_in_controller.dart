import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/common/routes/names.dart';

import '../common/services/global.dart';
import '../common/values/constant.dart';
import '../widgets/flutter_toast.dart';
import '../pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String typeOfSignIn) async {
    try {
      if (typeOfSignIn == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.emailInitial;
        String passwordAddress = state.passwordInitial;
        if (emailAddress.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("you need to fill email address"),
            backgroundColor: Colors.red,
          ));
          return;
        }
        if (emailAddress.isNotEmpty) {
          String gmail = "@gmail.com";
          String yahoo = "@yahoo.com";
          if (emailAddress.contains("{$gmail}") &&
              (emailAddress.contains("{$yahoo}")) == false) {
            toastInfo(message: "your email must have $gmail or $yahoo");
            return;
          }
        }
        if (passwordAddress.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("you need to fill email address"),
            backgroundColor: Colors.red,
          ));
          return;
        }
        if (passwordAddress.isNotEmpty) {
          if (passwordAddress.length < 8) {
            toastInfo(message: "your password must bigger than 7 letters");
            return;
          }
        }

        try {
          final dataComeFromFireBase = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: passwordAddress);
          print(dataComeFromFireBase.user!.email);
          if (!dataComeFromFireBase.user!.emailVerified) {
            // this mean you must verify your email for Auth مصداقيه
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("you need to verify your email account"),
              backgroundColor: Colors.red,
            ));
            return;
          }
          var user = dataComeFromFireBase.user;
          if (user != null) {
            Global.storageServices
                .setString(AppConstant.onUserLogin, "12341234");
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
          } else {
            toastInfo(message: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "email-already-in-use") {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("email already in use")));
          } else if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("your password provided is week!! try again")));
          } else if (e.code == 'invalid-email') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("your email address format is wrong")));
          }
        }
      }
      // else if(typeOfSignIn== "google"){
      //
      // }
      // else if(typeOfSignIn== "apple"){
      //
      // }
      // else if(typeOfSignIn== "facebook"){
      //
      // }
    } catch (e) {
      print(e);
    }
  }
}
