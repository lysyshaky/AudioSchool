import 'package:audio_school/feautres/home/widget/book_list.dart';

import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:audio_school/feautres/library/widgets/library_book.dart';
import 'package:audio_school/feautres/library/widgets/library_button.dart';
import 'package:flutter/material.dart';

import '../widget/profile_details.dart';

class ProfileDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isThemeDark = isDark(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileDetails(),
        ],
      ),
    );
  }
}
