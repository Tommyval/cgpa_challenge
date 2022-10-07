import 'package:cgpa_challenge/auth/authPage.dart';
import 'package:cgpa_challenge/pages/landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LinkedPage extends StatelessWidget {
  const LinkedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const LandingPage();
          } else {
            return const AuthPage();
          }
        }),
      ),
    );
  }
}
