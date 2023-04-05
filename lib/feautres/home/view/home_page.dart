import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../../navigation/nav.dart';
import '../widget/app_drawer.dart';
import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({
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
        title: const LogoTitle(),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.more_vert_sharp,
                  color: isThemeDark ? lightBG : darkBG)),
        ],
      ),
      // drawer: AppDrawer(),
      body: HomeView(),
    );
  }
}
