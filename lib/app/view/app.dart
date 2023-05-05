import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../../feautres/authentication/provider/login_helper.dart';
import '../../feautres/authentication/view/login_page.dart';
import '../../feautres/home/home.dart';
import '../../feautres/navigation/nav.dart';
import '../../feautres/theme/data.dart';
import '../../feautres/theme/theme_data.dart';
import '../../feautres/splash/view/splash_page.dart';
import '../../l10n/l10n.dart';
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Map<String, dynamic>? userData;
  String? apiToken;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final isLoggedIn = await LoginHelper().getIsUserLoggedIn();
    if (isLoggedIn) {
      final token = await LoginHelper().getApiToken();
      if (token != null) {
        final fetchedUserData = await _fetchUserData(token);
        setState(() {
          userData = fetchedUserData;
          apiToken = token;
        });
      }
    }
  }

  Future<Map<String, dynamic>> _fetchUserData(String token) async {
    final response = await http.get(
      Uri.parse('$API_URL/users/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final currentTheme = themeNotifier.isDarkTheme ? darkTheme : lightTheme;

    Widget homeWidget;
    if (userData != null && apiToken != null) {
      homeWidget = NavPage(userData: userData!, apiToken: apiToken!);
    } else {
      homeWidget = LoginPage();
    }

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: AnimatedSplashScreen(
        duration: 1000,
        nextScreen: homeWidget,
        splash: const SplashPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: themeNotifier.isDarkTheme ? lightBG : darkBG,
      ),
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
