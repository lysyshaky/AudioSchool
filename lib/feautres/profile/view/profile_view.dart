import 'package:audio_school/feautres/home/widget/book_list.dart';
import 'package:audio_school/feautres/home/widget/class_button.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:audio_school/feautres/library/widgets/library_book.dart';
import 'package:audio_school/feautres/library/widgets/library_button.dart';
import 'package:flutter/material.dart';

import '../widget/profile_tabs.dart';
import '../widget/user_status.dart';

class ProfileView extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfileView({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isThemeDark = isDark(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          UserStatus(userData: userData),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Divider(
              height: 1,
              thickness: 1,
              color: isThemeDark ? greyMain : greyNavDark,
            ),
          ),
          ProfileTabs(),
        ],
      ),
    );
  }
}
