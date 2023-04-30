import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> loginUser(String email, String password) async {
  final String apiUrl = "http://localhost:3000/v1/auth/login";
  final response = await http.post(
    Uri.parse(apiUrl),
    body: jsonEncode({'email': email, 'password': password}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Failed to login user');
  }
}

const baseUrl = 'http://localhost:3000/v1';

Future<bool> registerUser(
  String name,
  String email,
  String password,
) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/v1/auth/register'),
    body: {
      'name': name,
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 201) {
    return true;
  } else {
    return false;
  }
}

Future<Map<String, dynamic>> fetchData() async {
  final response =
      await http.get(Uri.parse('http://localhost:3000/v1/users/me'));
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load data from API');
  }
}

Future<Map<String, dynamic>> fetchUserData(String token) async {
  final response = await http.get(
    Uri.parse(
        'http://localhost:3000/v1/users/me?cache=${DateTime.now().millisecondsSinceEpoch}'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load user data from API');
  }
}
