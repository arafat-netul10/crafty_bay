import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/home_screen.dart';

class AppRoutes{
  static MaterialPageRoute<dynamic>? onGenerateRoute(RouteSettings settings){

    Widget widget = SizedBox();

    switch(settings.name){
      case SplashScreen.name:
        widget = SplashScreen();
        break;

      case SignInScreen.name:
        widget = SignInScreen();
        break;

      case SignUpScreen.name:
        widget = SignUpScreen();
        break;

        case HomeScreen.name:
        widget = HomeScreen();
        break;

        default:
          widget = SplashScreen();
    }
    return MaterialPageRoute(builder: (ctx) => widget);

  }

}