import 'package:flutter/material.dart';
import 'package:rover/core/widget/custom_text.dart';
import 'package:rover/ui/auth/welcome_page.dart';
import 'package:rover/ui/filter/filter_page.dart';
import 'package:rover/ui/root/root_page.dart';
import 'package:rover/ui/splash/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => SplashPage());

      case "/welcome":
        return MaterialPageRoute(builder: (context) => WelcomePage());

      case "/root":
        return MaterialPageRoute(builder: (context) => RootPage());

      case "/filter":
        return MaterialPageRoute(builder: (context) => FilterPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: CustomText(
                  text: "Page not found!",
                ),
              ),
            ));
  }
}
