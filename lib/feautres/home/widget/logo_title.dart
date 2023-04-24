import 'package:flutter/material.dart';

import '../../theme/theme_data.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isThemeDark = isDark(context);
    return Container(
      alignment: Alignment.centerLeft,
      width: 180,
      height: 180,
      child: isThemeDark
          ? const Image(image: AssetImage('assets/images/logo-dark.png'))
          : const Image(image: AssetImage('assets/images/logo.png')),
    );
  }
}
