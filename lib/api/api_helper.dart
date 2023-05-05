import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _apiKey = 'http://localhost:3000/v1/auth/login';

  Future<void> saveApiKey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_apiKey, apiKey);
  }

  Future<String?> getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_apiKey);
  }

  Future<void> removeApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_apiKey);
  }
}
