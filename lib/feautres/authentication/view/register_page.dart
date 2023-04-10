import 'package:audio_school/feautres/authentication/view/register_view.dart';

import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });

  // final Widget accountIcon;

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // bottomNavigationBar: MyBottomNavigationBar(),
        backgroundColor: isThemeDark ? darkBG : lightBG,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: isThemeDark ? darkBG : lightBG,
          iconTheme: IconThemeData(color: isThemeDark ? lightBG : blueMainDark),
          elevation: 0.0,
          centerTitle: false,
        ),
        // drawer: AppDrawer(),
        body: RegisterView(),
      ),
    );
  }
}
