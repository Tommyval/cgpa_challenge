import 'package:cgpa_challenge/pages/registerpage.dart';
import 'package:cgpa_challenge/pages/userlogin.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Userlogin(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showUserlogin: toggleScreens);
    }
  }
}
