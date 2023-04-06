import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:audio_school/feautres/library/view/library_view.dart';
import 'package:audio_school/feautres/library/widgets/library_text.dart';
import 'package:audio_school/feautres/profile/widgets/profile_text.dart';
import 'package:flutter/material.dart';

import 'view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
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
        title: ProfileText(),
      ),

      body: ProfileView(),
    );
  }
}
