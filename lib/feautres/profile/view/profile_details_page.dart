import 'package:audio_school/feautres/profile/view/profile_details_view.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';

import 'package:flutter/material.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({
    super.key,
  });

  // final Widget accountIcon;

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      // // bottomNavigationBar: MyBottomNavigationBar(),
      backgroundColor: isThemeDark ? darkBG : lightBG,

      appBar: AppBar(
        backgroundColor: isThemeDark ? darkBG : lightBG,
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Назад',
          style: TextStyle(color: isThemeDark ? lightBG : darkBG),
        ),
      ),

      body: ProfileDetailsView(),
    );
  }
}
