import 'package:flutter/material.dart';

import '../../../library/library.dart';
import '../../../profile/profile.dart';
import '../../../search/search.dart';
import '../../home/view/home_page.dart';
import '../../theme/theme_data.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    SearchPage(),
    LibraryPage(),
    ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      backgroundColor: isThemeDark ? darkBG : lightBG,
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
        ),
        child: BottomNavigationBar(
          // fixedColor: isThemeDark ? darkBG : lightBG,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: isThemeDark ? yellowMain : blueMain,
          unselectedItemColor: isThemeDark ? greyNavDark : greyNavLight,
          items: [
            BottomNavigationBarItem(
              backgroundColor: isThemeDark ? darkBG : lightBG,
              icon: Icon(
                Icons.home,
              ),
              label: 'Головна',
            ),
            BottomNavigationBarItem(
              backgroundColor: isThemeDark ? darkBG : lightBG,
              icon: Icon(Icons.search),
              label: 'Пошук',
            ),
            BottomNavigationBarItem(
              backgroundColor: isThemeDark ? darkBG : lightBG,
              icon: Icon(Icons.library_books),
              label: 'Бібліотека',
            ),
            BottomNavigationBarItem(
              backgroundColor: isThemeDark ? darkBG : lightBG,
              icon: Icon(Icons.person),
              label: 'Профіль',
            ),
          ],
        ),
      ),
    );
  }
}
