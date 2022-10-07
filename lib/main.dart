import 'package:cgpa_challenge/Route/route.dart';
import 'package:cgpa_challenge/Services/login_service.dart';
import 'package:cgpa_challenge/Services/provider.dart';
import 'package:cgpa_challenge/Services/theme_service.dart';
import 'package:cgpa_challenge/models/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Entries()),
      ChangeNotifierProvider(create: (context) => Login()),
      ChangeNotifierProvider(create: (context) => ThemeSettings())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeSettings>(builder: (context, value, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: value.darktheme ? darkTheme : lightTheme,
          initialRoute: RouteManager.homepage,
          onGenerateRoute: RouteManager.generateRoute);
    });
  }
}
