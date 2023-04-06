import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../theme/theme_data.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Text(
      'Пошук',
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: isThemeDark ? lightBG : blueMainDark,
        fontSize: 24.0,
        decoration: TextDecoration.underline,
        decorationThickness: 1.5,
        decorationColor: isThemeDark ? yellowMain : blueMain,
      ),
    );
  }
}
