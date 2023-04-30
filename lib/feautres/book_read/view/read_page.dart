import 'package:audio_school/feautres/book_details/book_details.dart';
import 'package:audio_school/feautres/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';

import 'read_view.dart';

class BookReadPage extends StatelessWidget {
  const BookReadPage({required this.userData, Key? key}) : super(key: key);
  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);

    return BookReadView(userData: userData);
  }
}
