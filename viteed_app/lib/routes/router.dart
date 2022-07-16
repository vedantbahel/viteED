import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viteed_app/routes/route_names.dart';
import 'package:viteed_app/screens/forgotpassword.dart';
import 'package:viteed_app/screens/home.dart';
import 'package:viteed_app/screens/login.dart';
import 'package:viteed_app/screens/passwordReset.dart';
import 'package:viteed_app/screens/signup.dart';

final appRouter = GoRouter(routes: appRoutes);

final appRoutes = <GoRoute>[
  _generateGoRoute(AppRouteNames.loginScreen, const Login()),
  _generateGoRoute(AppRouteNames.signUpScreen, const SignUp()),
  _generateGoRoute(AppRouteNames.passwordResetScreen, passwordReset()),
  _generateGoRoute(AppRouteNames.homeScreen, const Home()),
  _generateGoRoute(AppRouteNames.forgotPasswordScreen, forgotPassword()),
];

GoRoute _generateGoRoute(String path, Widget child) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}
