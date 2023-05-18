import 'package:audio_school/feautres/authentication/view/login_view.dart';
import 'package:audio_school/feautres/authentication/view/reset_password_view.dart';
import 'package:audio_school/feautres/authentication/view/view.dart';
import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ResetCodePage extends StatelessWidget {
  const ResetCodePage({
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
        title: Text(
          'Назад',
          style: TextStyle(
            color: isThemeDark ? lightBG : blueMainDark,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // drawer: AppDrawer(),
      body: ResetCodeView(),
    );
  }
}
