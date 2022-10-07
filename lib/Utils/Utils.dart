import 'package:flutter/material.dart';

class Utils {
  static const Color maintheme = Color(0xffF5F5F5);
  static const Color buttonColor = Color(0xffFF554D);
  static const Color textColor = Colors.blue;
  static const Color altColor = Colors.black;

  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);

    return (value != null || value!.isNotEmpty || regex.hasMatch(value));
  }
}
