import 'package:cgpa_challenge/Utils/Utils.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.maintheme,
      appBar: AppBar(
        backgroundColor: Utils.maintheme,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'back',
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'CGPA Calculator',
              style: TextStyle(color: Utils.textColor),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.restart_alt_sharp,
                  color: Utils.textColor,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: Utils.textColor,
                ))
          ],
        ),
      ),
    );
  }
}
