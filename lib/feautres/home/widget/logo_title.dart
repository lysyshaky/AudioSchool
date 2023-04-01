import 'package:flutter/material.dart';

import '../../theme/theme_data.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isThemeDark = isDark(context);
    return Container(
      alignment: Alignment.centerLeft,
      width: 150,
      height: 150,
      child: isThemeDark
          ? const Image(
              image: AssetImage(
                  '/Users/yuralysyshak/Documents/audio_school/assets/logo-dark.png'))
          : const Image(
              image: AssetImage(
                  '/Users/yuralysyshak/Documents/audio_school/assets/logo.png')),
    );
  }
}
