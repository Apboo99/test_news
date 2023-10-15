import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_news/pages/home.dart';
import 'package:test_news/pages/sign_in.dart';
import 'package:test_news/pages/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=> const SignUp(),
        "/sign_in":(context)=> const SignIn(),
        "/home":(context)=> const Home(),
      },
      initialRoute: "/",
    );
  }
}
