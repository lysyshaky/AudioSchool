import 'package:audio_school/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginHelper {
  static final String _isUserLoggedInKey = "isUserLoggedIn";
  static final String _apiTokenKey = "apiToken";

  Future<bool> getIsUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isUserLoggedInKey) ?? false;
  }

  Future<void> setIsUserLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isUserLoggedInKey, value);
  }

  Future<void> saveApiToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_apiTokenKey, token);
  }

  Future<String?> getApiToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_apiTokenKey);
  }

  Future<void> removeApiToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_apiTokenKey);
  }
}
