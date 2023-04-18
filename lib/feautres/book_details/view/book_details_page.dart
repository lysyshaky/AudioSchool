import 'package:audio_school/feautres/book_details/book_details.dart';
import 'package:audio_school/feautres/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//  body: HomeView(),
import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({
    super.key,
  });

  // final Widget accountIcon;

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    //   return Scaffold(
    //     // // bottomNavigationBar: MyBottomNavigationBar(),
    //     backgroundColor: isThemeDark ? darkBG : lightBG,

    //     appBar: AppBar(
    //       automaticallyImplyLeading: false,
    //       backgroundColor: isThemeDark ? darkBG : lightBG,
    //       elevation: 0.0,
    //       centerTitle: false,

    //       // actions: <Widget>[
    //       //   Padding(
    //       //       padding: const EdgeInsets.all(16.0),
    //       //       child: Icon(Icons.more_vert_sharp,
    //       //           color: isThemeDark ? lightBG : darkBG)),
    //       // ],
    //     ),
    //     // drawer: AppDrawer(),
    //     body: BookDetailsView(),
    //   );
    // }
    return BookDetailsView();
  }
}
