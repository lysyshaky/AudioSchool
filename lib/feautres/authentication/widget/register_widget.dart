import 'package:audio_school/feautres/navigation/view/view.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:audio_school/api/api.dart';

import '../provider/login_helper.dart';
import '../view/login_page.dart';

// const API_URL = 'http://localhost:3000/v1';
// Define userData as a global variable
// Map<String, dynamic> userData = {};
// String? authToken;
// dynamic? token;

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  void setAuthToken(String token) async {
    setState(() {
      authToken = token;
    });
    await storage.write(key: "token", value: token);
  }

  Future<void> _registerUser() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;

    // Check password length
    if (password.length < 8) {
      final bool isThemeDark = isDark(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: isThemeDark ? yellowMain : blueMain,
          content: Text(
            'Пароль повинен містити принаймні 8 символів, де є букви та цифри.',
            style: TextStyle(
              color: isThemeDark ? darkBG : lightBG,
              fontSize: 16,
            ),
          ),
        ),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('$API_URL/auth/register'),
      body: jsonEncode({
        'email': email,
        'password': password,
        'name': name,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      token = jsonDecode(response.body)['tokens']['access']['token'];
      print(token);

      userData = await _fetchUserData(token as String);
      print(userData);
      await LoginHelper().saveApiToken(token as String);

      await LoginHelper().setIsUserLoggedIn(true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavPage(
            userData: userData as Map<String, dynamic>,
            apiToken: token as String,
          ),
        ),
      );
    } else if (response.statusCode == 400) {
      final bool isThemeDark = isDark(context);
      // Email already taken, show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: isThemeDark ? yellowMain : blueMain,
          content: Text(
            'Цей е-мейл вже зареєстровано! Спробуйте інший.',
            style: TextStyle(
              color: isThemeDark ? darkBG : lightBG,
              fontSize: 16,
            ),
          ),
        ),
      );
    }
  }

  Future<Map<String, dynamic>> _fetchUserData(String token) async {
    final response = await http.get(
      Uri.parse('$API_URL/users/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      backgroundColor: isThemeDark ? darkBG : lightBG,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 320,
                  height: 70,
                  child: isThemeDark
                      ? const Image(
                          image: AssetImage('assets/images/logo-dark.png'))
                      : const Image(
                          image: AssetImage('assets/images/logo.png')),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Реєстрація',
                style: TextStyle(
                    color: isThemeDark ? lightBG : blueMainDark,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Container(
                  decoration: BoxDecoration(
                    color: isThemeDark ? Color(0xff313333) : greyLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            TextField(
                              controller: _nameController,
                              cursorColor: isThemeDark ? yellowMain : blueMain,
                              style: TextStyle(
                                  color: isThemeDark ? darkBG : blueMainDark),
                              decoration: InputDecoration(
                                hintText: 'Ім\'я та прізвище',
                                hintStyle: TextStyle(
                                    color: isThemeDark ? darkBG : blueMainDark),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          isThemeDark ? yellowMain : blueMain),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16),
                            TextField(
                              controller: _emailController,
                              cursorColor: isThemeDark ? yellowMain : blueMain,
                              style: TextStyle(
                                  color: isThemeDark ? darkBG : blueMainDark),
                              decoration: InputDecoration(
                                hintText: 'Е-мейл',
                                hintStyle: TextStyle(
                                    color: isThemeDark ? darkBG : blueMainDark),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          isThemeDark ? yellowMain : blueMain),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(height: 16),
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(primaryColor: yellowMain),
                              child: TextFormField(
                                controller: _passwordController,
                                cursorColor:
                                    isThemeDark ? yellowMain : blueMain,
                                style: TextStyle(
                                    color: isThemeDark ? darkBG : blueMainDark),
                                obscureText: _obscureText,
                                validator: (value) {
                                  if (value!.isEmpty && value.length < 8) {
                                    return 'Пароль повинен бути не менше 8 символів';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Пароль',
                                  hintStyle: TextStyle(
                                      color:
                                          isThemeDark ? darkBG : blueMainDark),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: isThemeDark
                                            ? yellowMain
                                            : blueMain),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color:
                                          isThemeDark ? yellowMain : blueMain,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: 326,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            _registerUser();
                          },

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const NavPage(),
                          //   ),
                          // );

                          child: Text(
                            'Створити обліковий запис',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isThemeDark ? darkBG : lightBG,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isThemeDark ? yellowMain : blueMain,
                            minimumSize: Size(326, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'Вибираючи Створити обліковий запис нижче, я погоджуюся з ',
                              style: isThemeDark
                                  ? TextStyle(color: lightBG)
                                  : TextStyle(color: blueMainDark),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Умовами обслуговування',
                                  style: TextStyle(
                                      color:
                                          isThemeDark ? yellowMain : blueMain,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: ' та ',
                                  style: isThemeDark
                                      ? TextStyle(color: lightBG)
                                      : TextStyle(color: blueMainDark),
                                ),
                                TextSpan(
                                  text: 'Політикою конфіденційності',
                                  style: TextStyle(
                                      color:
                                          isThemeDark ? yellowMain : blueMain,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '.',
                                  style: isThemeDark
                                      ? TextStyle(color: lightBG)
                                      : TextStyle(color: blueMainDark),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Вже є аккаунт? ',
                            style: TextStyle(
                              color: isThemeDark ? lightBG : blueMainDark,
                              fontSize: 14,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Авторизуватися',
                                style: TextStyle(
                                    color: isThemeDark ? yellowMain : blueMain,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ),
      // ),
    );
  }
}
