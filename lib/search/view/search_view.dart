import 'package:audio_school/feautres/home/widget/book_list.dart';
import 'package:audio_school/feautres/home/widget/class_button.dart';
import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SearchBar(),
          SizedBox(
            height: 10,
          ),
          BookList(),
        ],
      ),
    );
  }
}
