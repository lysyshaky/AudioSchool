import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:audio_school/feautres/library/view/library_view.dart';
import 'package:audio_school/feautres/library/widgets/library_text.dart';

import 'package:flutter/material.dart';

import '../widget/profile_text.dart';
import 'view.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfilePage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      backgroundColor: isThemeDark ? darkBG : lightBG,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: isThemeDark ? darkBG : lightBG,
        elevation: 0.0,
        centerTitle: false,
        title: ProfileText(),
      ),
      body: ProfileView(userData: userData),
    );
  }
}
