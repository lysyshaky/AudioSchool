import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: lightBG,
  primaryColor: blueMain,
  accentColor: blueMain,
  primaryTextTheme: const TextTheme(
    titleLarge: TextStyle(color: blueMainDark),
  ),
  // other color customization
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: darkBG,
  primaryColor: yellowMain,
  accentColor: yellowMain,

  // other color customization
);
