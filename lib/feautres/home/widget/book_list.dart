import 'package:audio_school/feautres/book_details/book_details.dart';
import 'package:audio_school/feautres/book_details/widget/book_details_widget.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  BookList({Key? key}) : super(key: key);

  final List<Map<String, String>> books = [
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '30 хв',
      'readTime': '45 хв',
    },
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '5 хв',
      'readTime': '12 хв',
    },
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
    },
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
    },
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '20 хв',
      'readTime': '28 хв',
    },
    // Add more books here
  ];

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Історія України',
                style: TextStyle(
                  fontSize: 20.0,
                  color: isThemeDark ? Colors.white : blueMainDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'Показати всі',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: isThemeDark ? yellowMain : blueMain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: isThemeDark ? yellowMain : blueMain,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   barrierDismissible: true,
                  //   builder: (BuildContext context) {
                  //     return Material(
                  //       color: Colors.transparent,
                  //       child: BookDetailsPage(),
                  //     );
                  //   },
                  // );
                  // Navigator.push(
                  //   context,
                  //   PageRouteBuilder(
                  //     pageBuilder: (context, animation, secondaryAnimation) =>
                  //         BookDetailsPage(),
                  //     opaque: false,
                  //   ),
                  // );
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
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    width: 140.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 180.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              books[index]['image']
                                  as String, // explicitly cast to String
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
                              fontSize: 16),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Весвітня Історія',
                style: TextStyle(
                  fontSize: 20.0,
                  color: isThemeDark ? Colors.white : blueMainDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // do something when the button is pressed
                },
                child: Row(
                  children: [
                    Text(
                      'Показати всі',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: isThemeDark ? yellowMain : blueMain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: isThemeDark ? yellowMain : blueMain,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  width: 140.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 180.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            books[index]['image']
                                as String, // explicitly cast to String
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
                            fontSize: 16),
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
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Біологія',
                style: TextStyle(
                  fontSize: 20.0,
                  color: isThemeDark ? Colors.white : blueMainDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // do something when the button is pressed
                },
                child: Row(
                  children: [
                    Text(
                      'Показати всі',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: isThemeDark ? yellowMain : blueMain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: isThemeDark ? yellowMain : blueMain,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  width: 140.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 180.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            books[index]['image']
                                as String, // explicitly cast to String
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
                            fontSize: 16),
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
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Геогрaфія',
                style: TextStyle(
                  fontSize: 20.0,
                  color: isThemeDark ? Colors.white : blueMainDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // do something when the button is pressed
                },
                child: Row(
                  children: [
                    Text(
                      'Показати всі',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: isThemeDark ? yellowMain : blueMain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: isThemeDark ? yellowMain : blueMain,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SizedBox(
                  width: 140.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 180.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            books[index]['image']
                                as String, // explicitly cast to String
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
                            fontSize: 16),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
