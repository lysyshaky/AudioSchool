import 'package:audio_school/feautres/book_listen/widget/listen_widget.dart';
import 'package:audio_school/feautres/book_read/widget/read_widget.dart';
import 'package:audio_school/feautres/home/widget/book_list.dart';
import 'package:audio_school/feautres/home/widget/class_button.dart';
import 'package:flutter/material.dart';

class BookReadView extends StatelessWidget {
  final Map<String, dynamic> userData;

  const BookReadView({required this.userData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadScreen();
  }
}
