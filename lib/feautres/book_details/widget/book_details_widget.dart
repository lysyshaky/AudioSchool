import 'dart:ui' as ui;
import 'package:audio_school/feautres/authentication/widget/login_widget.dart';
import 'package:audio_school/feautres/book_details/widget/book_similar_widget.dart';
import 'package:audio_school/feautres/book_listen/book_liten.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../../book_read/view/read_page.dart';
import '../../home/widget/book_list.dart';

class BookDetailsPopup extends StatefulWidget {
  BookDetailsPopup({
    Key? key,
    required ScrollController scrollController,
  }) : super(key: key);

  @override
  State<BookDetailsPopup> createState() => _BookDetailsPopupState();
}

class _BookDetailsPopupState extends State<BookDetailsPopup> {
  bool _isBookmarked = false;
  bool _isDownloaded = true;

  final List<Map<String, String>> books = [
    {
      'image': 'assets/images/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '30 хв',
      'readTime': '45 хв',
      'description':
          'Історія України 10 клас, книга описує події в історії України 19-20 століття. Тут ви дізнаєтесь про основні бої і в чиїх руках на цей час була ненька Україна та багато інших цікавих фак...'
    },
    // Add more books here
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    final Color backgroundColor = isThemeDark ? darkBG : lightBG;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isThemeDark ? darkBG : lightBG,
            ),
          ),
          Image.asset(
            books[index]['image']!,
            fit: BoxFit.cover,
            height: 280, // 350
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
            height: 280, // 350
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  isThemeDark
                      ? Colors.black.withOpacity(0.2)
                      : Colors.white.withOpacity(0.2),
                  isThemeDark
                      ? Colors.black.withOpacity(0.4)
                      : Colors.white.withOpacity(0.4),
                  isThemeDark
                      ? Colors.black.withOpacity(0.6)
                      : Colors.white.withOpacity(0.6),
                  isThemeDark
                      ? Colors.black.withOpacity(0.8)
                      : Colors.white.withOpacity(0.8)
                ],
              ),
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    books[index]['image']!,
                    fit: BoxFit.contain,
                    height: 250,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      books[index]['title']!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: isThemeDark ? lightBG : blueMainDark),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isBookmarked = !_isBookmarked;
                        });
                      },
                      child: Icon(
                        _isBookmarked
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_border_rounded,
                        color: _isBookmarked
                            ? isThemeDark
                                ? yellowMain
                                : blueMain
                            : isThemeDark
                                ? lightBG
                                : blueMainDark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  books[index]['author']!,
                  style: TextStyle(
                      fontSize: 18,
                      color: isThemeDark ? lightBG : blueMainDark),
                ),
                SizedBox(height: 16),
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: blueMainDark,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.book,
                                color: isThemeDark ? lightBG : lightBG),
                            SizedBox(width: 8),
                            Text(
                              '18 хвилин',
                              style: TextStyle(
                                color: isThemeDark ? lightBG : lightBG,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: isThemeDark ? lightBG : lightBG,
                        thickness: 1,
                        indent: 8,
                        endIndent: 8,
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.headphones,
                                color: isThemeDark ? lightBG : lightBG),
                            SizedBox(width: 8),
                            Text(
                              '10 хвилин',
                              style: TextStyle(
                                color: isThemeDark ? lightBG : lightBG,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Про цю книгу',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isThemeDark ? lightBG : blueMainDark),
                ),
                SizedBox(height: 8),
                Text(
                  books[index]['description']!,
                  style: TextStyle(
                      fontSize: 18,
                      color: isThemeDark ? lightBG : blueMainDark),
                ),
                SizedBox(height: 16),
                Text(
                  '56 Тем',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isThemeDark ? lightBG : blueMainDark),
                ),
                SizedBox(height: 16),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '01',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: isThemeDark ? lightBG : blueMainDark),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Вступ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: isThemeDark ? lightBG : blueMainDark,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 28, height: 4),
                            Expanded(
                              child: Text(
                                'Опис до вступу',
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        isThemeDark ? lightBG : blueMainDark),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isDownloaded = !_isDownloaded;
                          });
                        },
                        child: Icon(
                          _isDownloaded
                              ? Icons.play_circle
                              : Icons.file_download_rounded,
                          color: _isDownloaded
                              ? isThemeDark
                                  ? yellowMain
                                  : blueMain
                              : isThemeDark
                                  ? lightBG
                                  : blueMainDark,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '02',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: isThemeDark ? lightBG : blueMainDark),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Історія України 19 століття ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: isThemeDark ? lightBG : blueMainDark,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 28, height: 4),
                            Expanded(
                              child: Text(
                                'Ключові моменти та факти битв. ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        isThemeDark ? lightBG : blueMainDark),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // _isDownloaded = !_isDownloaded;
                          });
                        },
                        child: Icon(Icons.file_download_rounded,
                            color: isThemeDark ? lightBG : blueMainDark,
                            size: 32),
                        // child: Icon(
                        //   _isDownloaded
                        //       ? Icons.play_circle
                        //       : Icons.file_download_rounded,
                        //   color: _isDownloaded
                        //       ? isThemeDark
                        //           ? yellowMain
                        //           : blueMain
                        //       : isThemeDark
                        //           ? lightBG
                        //           : blueMainDark,
                        //   size: 32,
                        // ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '03',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: isThemeDark ? lightBG : blueMainDark),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Історія України 20 століття',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: isThemeDark ? lightBG : blueMainDark,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 28, height: 4),
                            Expanded(
                              child: Text(
                                'Ключові моменти в історії 20 сто.. ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        isThemeDark ? lightBG : blueMainDark),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // _isDownloaded = !_isDownloaded;
                          });
                        },
                        child: Icon(Icons.file_download_rounded,
                            color: isThemeDark ? lightBG : blueMainDark,
                            size: 32),
                        // child: Icon(
                        //   _isDownloaded
                        //       ? Icons.play_circle
                        //       : Icons.file_download_rounded,
                        //   color: _isDownloaded
                        //       ? isThemeDark
                        //           ? yellowMain
                        //           : blueMain
                        //       : isThemeDark
                        //           ? lightBG
                        //           : blueMainDark,
                        //   size: 32,
                        // ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0),
                BookSimilar(),
                SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isThemeDark ? lightBG : darkBG,
                  width: 1,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.close,
                    size: 24,
                    color: isThemeDark ? lightBG : blueMainDark,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookReadPage(userData: userData)));
                    // Handle the read button press
                  },
                  icon: Icon(Icons.book, color: isThemeDark ? darkBG : lightBG),
                  label: Text(
                    'Читати',
                    style: TextStyle(
                      color: isThemeDark ? darkBG : lightBG,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: isThemeDark ? greyText : greyNavLight,
                    minimumSize: Size(80, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Adjust the button size here
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, animation, secondaryAnimation) =>
                    //         PlayScreen(
                    //       book: books[index]['title']!,
                    //       title: books[index]['title']!,
                    //       image: books[index]['image']!,
                    //       author: books[index]['author']!,
                    //     ),
                    //     opaque: false,
                    //   ),
                    // );
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PlayScreen(
                    //               title: books[index]['title']!,
                    //               author: books[index]['author']!,
                    //               image: books[index]['image']!,
                    //               book: books[index]['title']!,
                    //             )));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookListenPage()));
                    // Handle the listen button press
                  },
                  icon: Icon(Icons.headphones,
                      color: isThemeDark ? darkBG : lightBG),
                  label: Text(
                    'Слухати',
                    style: TextStyle(
                      color: isThemeDark ? darkBG : lightBG,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: isThemeDark ? yellowMain : blueMain,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(210, 48), // Adjust the button size here
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
