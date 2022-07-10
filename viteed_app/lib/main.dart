import 'package:flutter/material.dart';
import 'package:viteed_app/screens/home.dart';
import 'package:viteed_app/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => login(),
        '/login': (context) => login(),
        '/home': (context) => home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
