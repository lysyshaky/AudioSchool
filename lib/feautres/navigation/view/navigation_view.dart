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
    SearchScreen(),
    LibraryScreen(),
    ProfileScreen(),
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
      bottomNavigationBar: BottomNavigationBar(
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: isThemeDark ? darkBG : lightBG,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: isThemeDark ? darkBG : lightBG,
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            backgroundColor: isThemeDark ? darkBG : lightBG,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
