import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class BookDetailsPopup extends StatelessWidget {
  BookDetailsPopup({
    Key? key,
    required ScrollController scrollController,
  }) : super(key: key);

  final List<Map<String, String>> books = [
    {
      'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
      'title': 'Історія України',
      'author': 'О.В. Матринюк',
      'listenTime': '30 хв',
      'readTime': '45 хв',
    },
    // Add more books here
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 32,
                  color: isThemeDark ? lightBG : blueMainDark,
                ),
              ),
              // Container(
              //   width: 40,
              //   height: 4,
              //   decoration: BoxDecoration(
              //     color: Colors.grey[300],
              //     borderRadius: BorderRadius.circular(2),
              //   ),
              // ),
              SizedBox(
                  width: 32 +
                      16.0), // To balance the close button size and padding
            ],
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              books[index]['image']!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            books[index]['title']!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: isThemeDark ? lightBG : blueMainDark),
          ),
          SizedBox(height: 8),
          Text(
            books[index]['author']!,
            style: TextStyle(
                fontSize: 18, color: isThemeDark ? lightBG : blueMainDark),
          ),
        ],
      ),
    );
  }
}
