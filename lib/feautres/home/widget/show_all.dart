import 'package:flutter/material.dart';

import '../../book_details/view/book_details_page.dart';
import '../../theme/theme_data.dart';

class AllBooksPage extends StatelessWidget {
  final String bookTitle;
  final List<Map<String, String>> books = [
    {
      'image': 'assets/images/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '30 хв',
      'readTime': '45 хв',
    },
    {
      'image': 'assets/images/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '5 хв',
      'readTime': '12 хв',
    },
    {
      'image': 'assets/images/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
    },
    {
      'image': 'assets/images/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
    },
    {
      'image': 'assets/images/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
    },
    // Add more books here
  ];
  AllBooksPage({Key? key, required this.bookTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isThemeDark ? darkBG : lightBG,
        iconTheme: IconThemeData(color: isThemeDark ? lightBG : blueMainDark),
        elevation: 0.0,
        centerTitle: false,
        title: Text(bookTitle,
            style: TextStyle(
                color: isThemeDark ? lightBG : blueMainDark,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: isThemeDark ? darkBG : lightBG,
        child: GridView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.62, mainAxisSpacing: 0),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
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
                      initialChildSize: 0.92,
                      minChildSize: 0.8,
                      maxChildSize: 0.92,
                      expand: false,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return BookDetailsPage();
                      },
                    );
                  },
                );

                // Handle book item tap
              },
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 180.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            books[index]['image']!,
                            width: 180,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        books[index]['title']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isThemeDark ? Colors.white : blueMainDark,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        books[index]['author']!,
                        style: TextStyle(
                          color: isThemeDark ? Colors.white : blueMainDark,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Icon(
                            Icons.headset,
                            color: isThemeDark ? greyText : blueMainDark,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            books[index]['listenTime']!,
                            style: TextStyle(
                              color: isThemeDark ? greyText : blueMainDark,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Icon(
                            Icons.menu_book_rounded,
                            color: isThemeDark ? greyText : blueMainDark,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            books[index]['readTime']!,
                            style: TextStyle(
                              color: isThemeDark ? greyText : blueMainDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
