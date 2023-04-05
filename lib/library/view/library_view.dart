import 'package:audio_school/feautres/home/widget/book_list.dart';
import 'package:audio_school/feautres/home/widget/class_button.dart';
import 'package:audio_school/library/widgets/library_book.dart';
import 'package:audio_school/library/widgets/library_button.dart';
import 'package:flutter/material.dart';

class LibraryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: LibraryButton(),
          ),
          SizedBox(
            height: 10,
          ),
          LibraryPage(),
        ],
      ),
    );
  }
}
