import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Text(
          'eComerce',
          style: GoogleFonts.playfairDisplay().copyWith(
              fontSize: size.width * 0.14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
