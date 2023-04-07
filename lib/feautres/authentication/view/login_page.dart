import 'package:audio_school/feautres/authentication/view/login_view.dart';
import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  // final Widget accountIcon;

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      // bottomNavigationBar: MyBottomNavigationBar(),
      backgroundColor: isThemeDark ? darkBG : lightBG,
      appBar: AppBar(
        backgroundColor: isThemeDark ? darkBG : lightBG,
        iconTheme: IconThemeData(color: isThemeDark ? lightBG : blueMainDark),
        elevation: 0.0,
        centerTitle: false,
      ),
      // drawer: AppDrawer(),
      body: LoginView(),
    );
  }
}
