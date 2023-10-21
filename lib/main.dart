import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'common/routes/pages.dart';
import 'common/services/global.dart';


Future<void> main() async {
  await Global.init();
  runApp(const NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppPages.generatePage
      ),
    );
  }
}
