import 'package:flutter/material.dart';
import 'package:viteed_app/screens/forgotpassword.dart';
import 'package:viteed_app/screens/home.dart';
import 'package:viteed_app/screens/login.dart';
import 'package:viteed_app/screens/signup.dart';

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
        '/': (context) => Login(),
        '/login': (context) => Login(),
        '/home': (context) => const Home(),
        '/signUp': (context) => SignUp(),
        '/forgotPassword': (context) => forgotPassword(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
