
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitup/Presentation/AvatorScreen/AvatorScreen.dart';
import 'package:habitup/Presentation/AvatorScreen/avator_bloc.dart';
import 'package:habitup/Presentation/MainScreen/MainScreen.dart';
import 'package:habitup/Presentation/MainScreen/main_screen_bloc.dart';

import '../Bloc/general_bloc.dart';
import '../Presentation/FeelingsSelection/FeelingSelection.dart';
import '../Presentation/FeelingsSelection/feelings_selection_bloc.dart';
import '../Presentation/LogInScreenY/LogInScreen.dart';
import '../Presentation/LogInScreenY/login_bloc.dart';
import '../Presentation/OnBoardingY/ob_boarding_bloc.dart';
import '../Presentation/OnBoardingY/onboardingscreen.dart';
import '../Presentation/SignupScreens/SignUpScreen.dart';
import '../Presentation/SignupScreens/signup_bloc.dart';
import '../Presentation/SplashScreenY/SplashScreen.dart';


class Routes {
  Route<dynamic>? OnGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/onBoarding":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
              create: (context) => ObBoardingBloc(), child: OnBoard()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case "/Initial":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => GeneralBloc(),
                  child: SplashScreen(),
                ));

      case "/LoginScreen":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case "/SignupScreen":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => SignupBloc(),
            child: SignupScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
        case "/AvatarScreen":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => AvatorBloc(),
            child: AvatorScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case "/FeelingsSelection":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => FeelingsSelectionBloc(),
            child: FeelingSelection(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
        case "/MainScreen":
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => MainScreenBloc(),
            child: MainScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
    }
  }
}
