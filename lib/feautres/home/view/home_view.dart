import 'package:audio_school/feautres/home/widget/book_list.dart';
import 'package:audio_school/feautres/home/widget/class_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ClassButton(),
        ),
        BookList(),
      ],
    );
  }
}
