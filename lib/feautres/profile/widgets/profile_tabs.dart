import 'package:audio_school/feautres/home/home.dart';
import 'package:audio_school/feautres/library/widgets/library_book.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_data.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({super.key});
  @override
  _ProfileTabsState createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  int _selectedIndex = 0;
  bool _switchValue = false;

  final List<Map<String, dynamic>> _tabs = [
    {
      'icon': Icons.person_outline,
      'text': 'Деталі профілю',
      'hasSwitch': false,
      'routeName': '/details',
    },
    {
      'icon': Icons.add_card,
      'text': 'Оплата',
      'hasSwitch': false,
      'routeName': '/payment',
    },
    {
      'icon': Icons.star_border,
      'text': 'Підписка',
      'hasSwitch': false,
      'routeName': '/subscription',
    },
    {
      'icon': Icons.contact_support_outlined,
      'text': 'Підтримка',
      'hasSwitch': false,
      'routeName': '/support',
    },
    {
      'icon': Icons.nightlight_outlined,
      'text': 'Нічна тема',
      'hasSwitch': true,
      'routeName': '/dark_mode',
    },
    {
      'icon': Icons.logout,
      'text': 'Вийти',
      'hasSwitch': false,
      'routeName': '/logout',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isThemeDark = isDark(context);

    return Column(
      children: [
        for (int i = 0; i < _tabs.length; i++)
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedIndex = i;
                //  Navigator.pushNamed(context, _tabs[i]['routeName'] as String);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              });
              // TODO: navigate to corresponding page
            },
            style: ElevatedButton.styleFrom(
              primary: isThemeDark ? darkBG : lightBG,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            ),
            child: Row(
              children: [
                Icon(
                  _tabs[i]['icon'] as IconData,
                  size: 24.0,
                  color: isThemeDark ? yellowMain : blueMain,
                ),
                SizedBox(width: 24.0),
                Text(
                  _tabs[i]['text'] as String,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: isThemeDark ? lightBG : blueMainDark),
                ),
                Spacer(),
                if (_tabs[i]['hasSwitch'] as bool)
                  Switch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                        if (value) {
                          // Switch is on, so set the theme to dark
                          Theme.of(context).brightness == Brightness.light;
                          _tabs[i]['icon'] = Icons.light_mode_outlined;
                          _tabs[i]['text'] = 'Денна тема';
                        } else {
                          // Switch is off, so set the theme to light
                          Theme.of(context).brightness == Brightness.dark;
                          _tabs[i]['icon'] = Icons.nightlight_outlined;
                          _tabs[i]['text'] = 'Нічна тема';
                        }
                      });
                    },
                    activeColor: isThemeDark ? yellowMain : blueMain,
                  )
                else
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: isThemeDark ? greyNavLight : greyNavLight,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

// import 'package:audio_school/feautres/home/home.dart';
// import 'package:flutter/material.dart';

// class NavigationTabs extends StatefulWidget {
//   const NavigationTabs({super.key});

//   @override
//   _NavigationTabsState createState() => _NavigationTabsState();
// }

// class _NavigationTabsState extends State<NavigationTabs> {
//   int _selectedIndex = 0;
//   bool _isDarkModeEnabled = false;

//   final List<Map<String, dynamic>> _tabs = [
//     {
//       'icon': Icons.person_outline,
//       'text': 'Details',
//       'hasSwitch': false,
//       'routeName': '/details',
//     },
//     {
//       'icon': Icons.add_card,
//       'text': 'Payment',
//       'hasSwitch': false,
//       'routeName': '/payment',
//     },
//     {
//       'icon': Icons.star_border,
//       'text': 'Subscription',
//       'hasSwitch': false,
//       'routeName': '/subscription',
//     },
//     {
//       'icon': Icons.contact_support_outlined,
//       'text': 'Support',
//       'hasSwitch': false,
//       'routeName': '/support',
//     },
//     {
//       'icon': Icons.nightlight_outlined,
//       'text': 'Dark Mode',
//       'hasSwitch': true,
//       'routeName': '/dark_mode',
//     },
//     {
//       'icon': Icons.logout,
//       'text': 'Logout',
//       'hasSwitch': false,
//       'routeName': '/logout',
//     },
//   ];

//   late ThemeData _currentTheme;

//   @override
//   void initState() {
//     super.initState();
//     _currentTheme = ThemeData.light();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (int i = 0; i < _tabs.length; i++)
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 _selectedIndex = i;
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                 );
//               });
//             },
//             style: ElevatedButton.styleFrom(
//               primary: _currentTheme.scaffoldBackgroundColor,
//               elevation: 0,
//               padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   _tabs[i]['icon'] as IconData,
//                   size: 24.0,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(width: 24.0),
//                 Text(
//                   _tabs[i]['text'] as String,
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                     color: _currentTheme.textTheme.headline6!.color,
//                   ),
//                 ),
//                 Spacer(),
//                 if (_tabs[i]['hasSwitch'] as bool)
//                   Switch(
//                     value: _isDarkModeEnabled,
//                     onChanged: (value) {
//                       setState(() {
//                         _isDarkModeEnabled = value;
//                         if (value) {
//                           // Switch is on, so set the theme to dark
//                           _currentTheme = ThemeData.dark();
//                         } else {
//                           // Switch is off, so set the theme to light
//                           _currentTheme = ThemeData.light();
//                         }
//                       });
//                     },
//                     activeColor: Colors.blue,
//                   )
//                 else
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     size: 16.0,
//                     color: Colors.grey,
//                   ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }
