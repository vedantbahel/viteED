import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viteed_app/constants/app_colors.dart';
import 'package:viteed_app/constants/app_constants.dart';
import 'package:viteed_app/screens/bottomnav.dart';
import 'package:viteed_app/screens/forgotpassword.dart';
import 'package:viteed_app/screens/home.dart';
import 'package:viteed_app/screens/login.dart';
import 'package:viteed_app/screens/profile.dart';
import 'package:viteed_app/screens/signup.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  client
      .setEndpoint(AppConstants.endPoint)
      .setProject(AppConstants.projectId)
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
        '/bottomnav': (context) => const BottomNav(),
        '/home': (context) => const Home(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/signUp': (context) => const SignUp(),
        '/Profile': (context) => const Profile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
