import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_news/pages/sign_up/sign_up.dart';

import '../../widgets/const_widgets.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: verySmallText(text: "home", color: Colors.black),
      )
    );
  }
}
