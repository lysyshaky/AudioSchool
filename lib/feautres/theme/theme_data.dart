import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

const darkBG = Color.fromRGBO(24, 26, 26, 1);
const lightBG = Color.fromRGBO(248, 248, 248, 1);

const yellowMain = Color.fromRGBO(240, 204, 70, 1);
const blueMain = Color.fromRGBO(36, 87, 175, 1);
const blueMainDark = Color.fromRGBO(20, 40, 75, 1);
const greyMain = Color.fromRGBO(49, 51, 51, 1);
const greyText = Color.fromRGBO(196, 204, 204, 1);
const greyNavLight = Color.fromRGBO(156, 156, 156, 1);
const greyNavDark = Color.fromRGBO(196, 204, 204, 1);
const greySearch = Color.fromRGBO(147, 153, 153, 1);
const greyLight = Color.fromRGBO(234, 244, 244, 1);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _pref;
  bool _isDarkTheme;

  ThemeNotifier(bool isDarkTheme) : _isDarkTheme = isDarkTheme {
    _loadFromPrefs();
  }

  bool get isDarkTheme => _isDarkTheme;

  void setTheme(bool isDarkTheme) {
    _isDarkTheme = isDarkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  void setDarkTheme(bool value) {
    _isDarkTheme = value;
    _saveToPrefs();
    notifyListeners();
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) {
      _pref = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _isDarkTheme = _pref!.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref!.setBool(key, _isDarkTheme);
  }
}

class ThemeModel extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
