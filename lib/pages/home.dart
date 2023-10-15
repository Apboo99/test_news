import 'package:flutter/material.dart';

import '../widgets/const_widgets.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: verySmallText(text: "home", color: Colors.black),
      ),
    );
  }
}
