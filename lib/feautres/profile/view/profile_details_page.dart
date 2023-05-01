import 'package:audio_school/feautres/authentication/widget/login_widget.dart';
import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:audio_school/feautres/profile/profile.dart';
import 'package:audio_school/feautres/profile/view/profile_details_view.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';

import 'package:flutter/material.dart';

import '../../../api/api.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            int _currentIndex = 3;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NavPage(
                      userData: userData,
                    )));
          },
        ),
        iconTheme: IconThemeData(color: isThemeDark ? lightBG : blueMainDark),
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
