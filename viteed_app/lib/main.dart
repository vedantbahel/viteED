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
import 'package:shared_preferences/shared_preferences.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  Future<void> checkLogin() {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((value) {
      if (value.getBool('login') != null) {
        setState(() {
          isLogin = value.getBool('login')!;
        });
      }
    });
    return Future.value();
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => isLogin ? const BottomNav() : const Login(),
        '/login': (context) => const Login(),
        '/bottomnav': (context) => const BottomNav(),
        '/home': (context) => Home(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/signUp': (context) => const SignUp(),
        '/Profile': (context) => const Profile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
