import 'package:audio_school/feautres/authentication/view/login_page.dart';
import 'package:audio_school/feautres/authentication/widget/register_widget.dart';
import 'package:audio_school/feautres/home/home.dart';
import 'package:audio_school/feautres/library/widgets/library_book.dart';
import 'package:audio_school/feautres/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../theme/theme_data.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({Key? key}) : super(key: key);
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
      'icon': Icons.theater_comedy_outlined,
      'text': 'Стати частиною команди',
      'hasSwitch': false,
      'routeName': '/team',
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
  void _logout() {
    // Clear token and userData
    authToken = null;
    token = null;
    userData = {};

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

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
                if (_tabs[i]['routeName'] == '/logout') {
                  _logout();
                } else if (_tabs[i]['routeName'] == '/details') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileDetailsPage(),
                    ),
                  );
                } else if (_tabs[i]['routeName'] == '/support') {
                } else if (_tabs[i]['routeName'] == '/payment') {
                } else if (_tabs[i]['routeName'] == '/team') {
                } else if (_tabs[i]['routeName'] == '/subscription') {
                } else {
                  // Toggle the switch state and change the icon accordingly
                  _switchValue = !_switchValue;
                  if (_switchValue) {
                    _tabs[i]['icon'] = Icons.light_mode_outlined;
                    _tabs[i]['text'] = 'Денна тема';
                  } else {
                    _tabs[i]['icon'] = Icons.nightlight_outlined;
                    _tabs[i]['text'] = 'Нічна тема';
                  }
                  // Update the theme based on the switch state
                  if (_switchValue) {
                  } else {}
                }
              });
            },
            style: ElevatedButton.styleFrom(
              primary: isThemeDark ? darkBG : lightBG,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
            ),
            child: Row(
              children: [
                // SizedBox(
                //   height: 30,
                // ),
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
                          _tabs[i]['icon'] = Icons.light_mode_outlined;
                          _tabs[i]['text'] = 'Денна тема';
                        } else {
                          _tabs[i]['icon'] = Icons.nightlight_outlined;
                          _tabs[i]['text'] = 'Нічна тема';
                        }
                        if (value) {
                        } else {}
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
