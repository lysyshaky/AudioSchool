import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:audio_school/feautres/profile/profile.dart';
import 'package:audio_school/feautres/profile/view/profile_details_view.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';

import 'package:flutter/material.dart';

import '../widget/profile_details.dart';

class ProfileDetailsPage extends StatelessWidget {
  final Map<String, dynamic> userData;
  final String token;
  ProfileDetailsPage({required this.userData, required this.token});

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
                      apiToken: authToken as String,
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
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: ProfileDetailsView(
          userData: userData,
          authToken: authToken as String,
        ),
      ),
    );
  }
}
