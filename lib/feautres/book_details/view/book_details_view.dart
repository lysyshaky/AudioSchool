import 'package:audio_school/feautres/home/widget/book_list.dart';
import 'package:audio_school/feautres/home/widget/class_button.dart';
import 'package:flutter/material.dart';

import '../widget/book_details_widget.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BookDetailsPopup(
      scrollController: ScrollController(),
    );
  }
}
