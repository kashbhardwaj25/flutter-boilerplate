import 'package:flutter_boilerplate/screens/home_screen/home_screen.dart';
import 'package:flutter_boilerplate/screens/login_screen/login_screen.dart';
import 'package:flutter_boilerplate/screens/register_otp/register_otp.dart';
import 'package:flutter_boilerplate/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_boilerplate/routes/route_names.dart';
import 'package:flutter_boilerplate/utils/shared_axis_transition.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    Widget page;
    int transitionDuration = 300;
    int reverseTransitionDuration = 300;
    bool isPageTransition = false;
    PageTransitionType pageTransitionTransitionType =
        PageTransitionType.rightToLeft;

    switch (settings.name) {
      case (Routes.register):
        isPageTransition = true;
        page = const SignupScreen();
        break;

      case (Routes.registerOtp):
        page = const RegisterOtp();
        break;

      case (Routes.login):
        page = const LoginScreen();
        break;

      case (Routes.home):
        page = const HomeScreen();
        break;

      default:
        page = const LoginScreen();
        break;
    }

    return isPageTransition == true
        ? PageTransition(
            type: pageTransitionTransitionType,
            child: page,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: transitionDuration),
            reverseDuration: Duration(milliseconds: reverseTransitionDuration),
          )
        : PageRouteBuilder(
            transitionDuration: Duration(milliseconds: transitionDuration),
            reverseTransitionDuration: Duration(
              milliseconds: reverseTransitionDuration,
            ),
            pageBuilder: (context, animation, secondaryAnimation) {
              return CustomSharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: page,
              );
            },
          );
  }
}
