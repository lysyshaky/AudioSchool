import 'package:flutter/material.dart';

ThemeData appThemeData() {
  return ThemeData(
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: Color.fromARGB(255, 31, 108, 114)),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle:
          const TextStyle(color: Color.fromARGB(255, 31, 108, 114)),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Color.fromARGB(255, 31, 108, 114),
        ),
      ),
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
      ),
    ),
  );
}
