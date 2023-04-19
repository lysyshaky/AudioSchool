import 'dart:ui' as ui;
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

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

  final List<Map<String, String>> books = [
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
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
                  isThemeDark ? Colors.black.withOpacity(0.8) : Colors.white
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
