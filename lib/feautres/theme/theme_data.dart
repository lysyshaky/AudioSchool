import 'package:flutter/material.dart';

bool isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

const darkBG = Color.fromRGBO(24, 26, 26, 1);
const lightBG = Color.fromRGBO(248, 248, 248, 1);

const yellowMain = Color.fromRGBO(240, 204, 70, 1);
const blueMain = Color.fromRGBO(36, 87, 175, 1);
const blueMainDark = Color.fromRGBO(20, 40, 75, 1);
const greyMain = Color.fromRGBO(49, 51, 51, 1);
const greyText = Color.fromRGBO(196, 204, 204, 1);
const greyNavLight = Color.fromRGBO(156, 156, 156, 1);
const greyNavDark = Color.fromRGBO(196, 204, 204, 1);
const greySearch = Color.fromRGBO(147, 153, 153, 1);

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
