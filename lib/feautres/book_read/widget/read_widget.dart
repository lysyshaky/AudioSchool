import 'package:audio_school/feautres/book_listen/book_liten.dart';
import 'package:audio_school/feautres/book_listen/widget/listen_widget.dart';
import 'package:audio_school/feautres/book_read/widget/text_size.widget.dart';
import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:flutter/material.dart';

import '../../book_details/view/book_details_page.dart';
import '../../theme/theme_data.dart';

int index = 0;
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

class ReadScreen extends StatefulWidget {
  ReadScreen({
    super.key,
  });

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      backgroundColor: isThemeDark ? darkBG : lightBG,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isThemeDark ? lightBG : blueMainDark,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 36,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavPage()),
            );
          },
        ),
        elevation: 0,
        backgroundColor: isThemeDark ? darkBG : lightBG,
        title: Text(
          '§1. Вступ',
          style: TextStyle(
            color: isThemeDark ? lightBG : blueMainDark,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.format_size_rounded,
                color: isThemeDark ? lightBG : blueMainDark),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: isThemeDark ? darkBG : lightBG,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                builder: (context) {
                  return DraggableScrollableSheet(
                    initialChildSize: 0.2,
                    minChildSize: 0.2,
                    maxChildSize: 0.3,
                    expand: false,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return TextSizeWidget();
                    },
                  );
                },
              );
              // Implement your functionality for showing text here.
            },
          ),
          IconButton(
            icon: Icon(Icons.play_arrow_rounded,
                color: isThemeDark ? lightBG : blueMainDark),
            onPressed: () {
              // Implement your functionality for showing text here.
            },
          ),
          IconButton(
            icon: Icon(Icons.headphones,
                color: isThemeDark ? lightBG : blueMainDark),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookListenPage()));
              // Implement your functionality for showing text here.
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        books[index]['description']!,
                        maxLines: 8,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: isThemeDark ? lightBG : blueMainDark),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '''Далеко далеко, за горами слова, далеко від країн Vokalia і Consonantia живуть сліпі тексти. Розділені вони живуть у Bookmarksgrove прямо на узбережжі Семантики, великого мовного океану. Невелика річка на ім'я Дуден протікає біля їхнього місця і постачає його необхідними регеліяліями. Це райська країна, в якій засмажені частини речень летять до рота.''',
                        // Style for the text
                        style: TextStyle(
                          fontSize: 18,
                          color: isThemeDark ? lightBG : blueMainDark,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '''Далеко далеко, за горами слова, далеко від країн Vokalia і Consonantia живуть сліпі тексти. Розділені вони живуть у Bookmarksgrove прямо на узбережжі Семантики, великого мовного океану. Невелика річка на ім'я Дуден протікає біля їхнього місця і постачає його необхідними регеліяліями. Це райська країна, в якій засмажені частини речень летять до рота.''',
                        // Style for the text
                        style: TextStyle(
                          fontSize: 16,
                          color: isThemeDark ? lightBG : blueMainDark,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '''Далеко далеко, за горами слова, далеко від країн Vokalia і Consonantia живуть сліпі тексти. Розділені вони живуть у Bookmarksgrove прямо на узбережжі Семантики, великого мовного океану. Невелика річка на ім'я Дуден протікає біля їхнього місця і постачає його необхідними регеліяліями. Це райська країна, в якій засмажені частини речень летять до рота.''',
                        // Style for the text
                        style: TextStyle(
                          fontSize: 16,
                          color: isThemeDark ? lightBG : blueMainDark,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '''Далеко далеко, за горами слова, далеко від країн Vokalia і Consonantia живуть сліпі тексти. Розділені вони живуть у Bookmarksgrove прямо на узбережжі Семантики, великого мовного океану. Невелика річка на ім'я Дуден протікає біля їхнього місця і постачає його необхідними регеліяліями. Це райська країна, в якій засмажені частини речень летять до рота.''',
                        // Style for the text
                        style: TextStyle(
                          fontSize: 16,
                          color: isThemeDark ? lightBG : blueMainDark,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '''Далеко далеко, за горами слова, далеко від країн Vokalia і Consonantia живуть сліпі тексти. Розділені вони живуть у Bookmarksgrove прямо на узбережжі Семантики, великого мовного океану. Невелика річка на ім'я Дуден протікає біля їхнього місця і постачає його необхідними регеліяліями. Це райська країна, в якій засмажені частини речень летять до рота.''',
                        // Style for the text
                        style: TextStyle(
                          fontSize: 16,
                          color: isThemeDark ? lightBG : blueMainDark,
                        ),
                      ),
                      SizedBox(height: 16),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
