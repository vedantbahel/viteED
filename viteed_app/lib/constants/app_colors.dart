import 'package:flutter/material.dart';

const MaterialColor primaryColor = MaterialColor(
  0xFFA29CF4,
  <int, Color>{
    50: Color.fromRGBO(162, 156, 244, 0.1),
    100: Color.fromRGBO(162, 156, 244, 0.2),
    200: Color.fromRGBO(162, 156, 244, 0.3),
    300: Color.fromRGBO(162, 156, 244, 0.4),
    400: Color.fromRGBO(162, 156, 244, 0.5),
    500: Color.fromRGBO(162, 156, 244, 0.6),
    600: Color.fromRGBO(162, 156, 244, 0.7),
    700: Color.fromRGBO(162, 156, 244, 0.8),
    800: Color.fromRGBO(162, 156, 244, 0.9),
    900: Color.fromRGBO(162, 156, 244, 1),
  },
);

/// Use [AppColors.primaryColor] to get colors.
/// Please follow the convention as it is in [primaryColor]
/// use Hex colors as much as possible.
/// follow [https://gist.github.com/lopspower/03fb1cc0ac9f32ef38f4] this
/// to adjust opacity.
class AppColors {
  AppColors._();
  static const Color primaryColor = Color(0xFFFFFFFF);
}
