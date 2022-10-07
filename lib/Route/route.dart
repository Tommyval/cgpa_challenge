import 'package:cgpa_challenge/pages/landingpage.dart';
import 'package:cgpa_challenge/pages/splashpage.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String homepage = '/';
  static const String splashpage = '/StartApp';
  static const String landingpage = '/LandingPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
          builder: (context) => const StartApp(),
        );
      case landingpage:
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
        );
      default:
        throw const FormatException('route not found');
    }
  }
}
