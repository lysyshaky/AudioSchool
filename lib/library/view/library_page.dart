import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:audio_school/library/view/library_view.dart';
import 'package:audio_school/library/widgets/library_text.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({
    super.key,
  });

  // final Widget accountIcon;

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      // // bottomNavigationBar: MyBottomNavigationBar(),
      backgroundColor: isThemeDark ? darkBG : lightBG,

      appBar: AppBar(
        backgroundColor: isThemeDark ? darkBG : lightBG,
        elevation: 0.0,
        centerTitle: false,
        title: LibraryText(),
        // actions: <Widget>[
        //   Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Icon(Icons.more_vert_sharp,
        //           color: isThemeDark ? lightBG : darkBG)),
        // ],
      ),
      // drawer: AppDrawer(),
      body: LibraryView(),
    );
  }
}
