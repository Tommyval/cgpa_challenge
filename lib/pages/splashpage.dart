import 'package:cgpa_challenge/pages/homepage.dart';
import 'package:flutter/material.dart';

import '../Utils/Utils.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    });
    return Scaffold(
        backgroundColor: Utils.maintheme,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text(
                'UCP',
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff23693D),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
                child: Text(
              'GPA \$ CGPA',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff23693D)),
                ),
              ),
            )
          ],
        ));
  }
}
