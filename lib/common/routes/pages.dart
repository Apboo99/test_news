

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/pages/home/bloc/home_bloc.dart';
import 'package:test_news/pages/home/home.dart';

import '../../pages/sign_in/bloc/sign_in_bloc.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/sign_up/bloc/sign_up_bloc.dart';
import '../../pages/sign_up/sign_up.dart';
import '../../pages/welcome/bloc/welcome_bloc.dart';
import '../../pages/welcome/welcome.dart';
import '../services/global.dart';
import 'names.dart';

class PageEntity {
  final String route;
  final Widget page;
  final dynamic bloc;
  PageEntity({required this.route, required this.page, required this.bloc});
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.initial,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.signIn,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.signUp,
        page:  SignUp(),
        bloc: BlocProvider(create: (_) => SignUpBloc()),
      ),
      PageEntity(
        route: AppRoutes.home,
        page:  const Home(),
        bloc: BlocProvider(create: (_) => HomeBloc()),
      ),

    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> providers = <dynamic>[];
    for (var bloc in routes()) {
      providers.add(bloc.bloc);
    }

    return providers;
  }

  static MaterialPageRoute generatePage(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool checkForOnBoardingOpened = Global.storageServices.getThatOnBoardingOpened();
        // if OnBoarding opened once >>So it will disappear from app and sign_in will replace it.
        if (result.first.route == AppRoutes.initial &&
            checkForOnBoardingOpened) {
          bool isLoggedIn = Global.storageServices.getLogIn();

          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const Home(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    // لو عملت navigate لصفحه مش معرفه هيعمل navigate ل signin
    print("Not valid ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}
