// light theme
import 'package:flutter/material.dart';
import 'package:movie_app/Theme/color.dart';

class ThemeProperties {
  // light theme
  var lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
          surface: AppColor().lbgColor,
          onSurface: AppColor().lTextColor,
          primary: AppColor().lButton,
          onPrimary: AppColor().lCard));

// dark theme

  var darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
          surface: AppColor().dbgColor,
          onSurface: AppColor().dTextColor,
          primary: AppColor().dButton,
          onPrimary: AppColor().dCard));
}
