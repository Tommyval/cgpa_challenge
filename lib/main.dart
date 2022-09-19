import 'package:cgpa_challenge/Services/provider.dart';
import 'package:cgpa_challenge/pages/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Entries(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      home: StartApp(),
    );
  }
}
