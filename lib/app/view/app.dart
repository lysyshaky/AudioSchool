import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audio_school/counter/counter.dart';
import 'package:audio_school/feautres/authentication/view/login_page.dart';
import 'package:audio_school/feautres/authentication/view/register_page.dart';
import 'package:audio_school/feautres/home/home.dart';
import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:audio_school/feautres/test/test.dart';
import 'package:audio_school/l10n/l10n.dart';

import 'package:audio_school/feautres/search/search.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../api/api.dart';
import '../../feautres/authentication/widget/login_widget.dart';
import '../../feautres/splash/view/splash_page.dart';
import '../../feautres/theme/data.dart';
import '../../feautres/theme/theme_data.dart';
import '../../feautres/library/library.dart';

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    final isThemeDark = isDark(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      theme: themeNotifier.isDarkTheme ? darkTheme : lightTheme,
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      //   colorScheme: ColorScheme.fromSwatch(
      //     accentColor: const Color(0xFF13B9FF),
      //   ),
      //   textSelectionTheme: TextSelectionThemeData(
      //     selectionColor: yellowMain,
      //   ),
      // ),
      routes: {
        NavPage.routeName: (context) => NavPage(userData: userData),
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: AnimatedSplashScreen(
        duration: 1000,
        splash: const SplashPage(),
        nextScreen: LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: isThemeDark ? darkBG : lightBG,
      ),
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
