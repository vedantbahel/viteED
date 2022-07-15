import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viteed_app/constants/apis.dart';
import 'package:viteed_app/constants/color.dart';
import 'package:viteed_app/screens/home.dart';
import 'package:viteed_app/screens/login.dart';
import 'package:viteed_app/screens/signup.dart';
import 'package:viteed_app/screens/forgotpassword.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  client
      .setEndpoint(Api().endPoint)
      .setProject(Api().projectId)
      .setSelfSigned(status: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => const Login(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/forgotPassword': (context) => forgotPassword(),
        '/signUp': (context) => const SignUp()

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
