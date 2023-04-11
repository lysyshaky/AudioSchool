import 'package:audio_school/feautres/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//  body: HomeView(),
import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../widgets/search_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
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
        automaticallyImplyLeading: false,
        backgroundColor: isThemeDark ? darkBG : lightBG,
        elevation: 0.0,
        centerTitle: false,
        title: const SearchText(),
        // actions: <Widget>[
        //   Padding(
        //       padding: const EdgeInsets.all(16.0),
        //       child: Icon(Icons.more_vert_sharp,
        //           color: isThemeDark ? lightBG : darkBG)),
        // ],
      ),
      // drawer: AppDrawer(),
      body: SearchView(),
    );
  }
}




// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         SizedBox(
//           height: 80,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'пошук',
//                 style: TextStyle(
//                   fontSize: 24,
//                   decoration: TextDecoration.underline,
//                   decorationThickness: 2,
//                   decorationColor: Colors.yellow,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Container(
//           height: 80,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 offset: Offset(0, 1),
//                 blurRadius: 3,
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Icon(Icons.search),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration.collapsed(
//                       hintText: 'Назва, автор або ключове слово',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
