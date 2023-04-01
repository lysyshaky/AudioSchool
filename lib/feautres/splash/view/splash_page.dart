import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    final isThemeDark = isDark(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: isThemeDark ? darkBG : lightBG,
      body: Center(
        child: isThemeDark
            ? const Image(
                image: AssetImage(
                    '/Users/yuralysyshak/Documents/audio_school/assets/logo-dark.png'),
              )
            : const Image(
                image: AssetImage(
                    '/Users/yuralysyshak/Documents/audio_school/assets/logo.png'),
              ),
      ),
    );
  }
}
