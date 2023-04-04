// import 'package:flutter/material.dart';

// import '../../feautres/theme/theme_data.dart';

// class Book {
//   final String image;
//   final String title;
//   final String author;
//   final String bookDescription;
//   final String listenTime;
//   final String readTime;

//   Book({
//     required this.image,
//     required this.title,
//     required this.author,
//     required this.bookDescription,
//     required this.listenTime,
//     required this.readTime,
//   });
// }

// class LibraryScreen extends StatelessWidget {
//   LibraryScreen({super.key});

//   final List<Map<String, String>> books = [
//     {
//       'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
//       'title': 'Історія України',
//       'author': 'О.В. Матринюк',
//       'listenTime': '30 хв',
//       'readTime': '45 хв',
//     },
//     {
//       'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
//       'title': 'Історія України',
//       'author': 'О.В. Матринюк',
//       'listenTime': '5 хв',
//       'readTime': '12 хв',
//     },
//     {
//       'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
//       'title': 'Історія України',
//       'author': 'О.В. Матринюк',
//       'listenTime': '20 хв',
//       'readTime': '28 хв',
//     },
//     {
//       'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
//       'title': 'Історія України',
//       'author': 'О.В. Матринюк',
//       'listenTime': '20 хв',
//       'readTime': '28 хв',
//     },
//     {
//       'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
//       'title': 'Історія України',
//       'author': 'О.В. Матринюк',
//       'listenTime': '20 хв',
//       'readTime': '28 хв',
//     },
//     // Add more books here
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final bool isThemeDark = isDark(context);
//     return SizedBox(
//       height: 300.0,
//       child: Wrap(
//         runSpacing: 16.0,
//         children: List.generate(books.length, (int index) {
//           return SizedBox(
//             width: MediaQuery.of(context).size.width / 2 - 24.0,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 180.0,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0),
//                     child: Image.asset(
//                       books[index]['image'] as String,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   books[index]['title']!,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: isThemeDark ? Colors.white : blueMainDark,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 4.0),
//                 Text(
//                   books[index]['author']!,
//                   style: TextStyle(
//                     color: isThemeDark ? Colors.white : blueMainDark,
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.headset,
//                       color: isThemeDark ? greyText : blueMainDark,
//                     ),
//                     const SizedBox(width: 4.0),
//                     Text(
//                       books[index]['listenTime']!,
//                       style: TextStyle(
//                         color: isThemeDark ? greyText : blueMainDark,
//                       ),
//                     ),
//                     const SizedBox(width: 8.0),
//                     Icon(
//                       Icons.menu_book_rounded,
//                       color: isThemeDark ? greyText : blueMainDark,
//                     ),
//                     const SizedBox(width: 4.0),
//                     Text(
//                       books[index]['readTime']!,
//                       style: TextStyle(
//                         color: isThemeDark ? greyText : blueMainDark,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '30 хв',
      'readTime': '45 хв',
      'description': 'Книга про історію України',
    },
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '5 хв',
      'readTime': '12 хв',
      'description': 'Книга про історію України',
    },
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
      'description': 'Книга про історію України',
    },
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
      'description': 'Книга про історію України',
    },
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
      'description': 'Книга про історію України',
    },

    // Add more books here
  ];

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.56,
                ),
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              width: 180,
                              height: 180,
                              books[index]['image']
                                  as String, // explicitly cast to String
                              fit: BoxFit.cover,
                              //fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          books[index]['title']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: isThemeDark ? Colors.white : blueMainDark,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          books[index]['author']!,
                          style: TextStyle(
                            color: isThemeDark ? Colors.white : blueMainDark,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          books[index]['description']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: isThemeDark ? Colors.white : blueMainDark,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(
                              Icons.headset,
                              color: isThemeDark ? greyText : blueMainDark,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              books[index]['listenTime']!,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: isThemeDark ? greyText : blueMainDark,
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Icon(
                              Icons.menu_book_rounded,
                              color: isThemeDark ? greyText : blueMainDark,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              books[index]['readTime']!,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: isThemeDark ? greyText : blueMainDark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
