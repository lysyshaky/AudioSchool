import 'package:audio_school/feautres/authentication/view/view.dart';
import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:audio_school/feautres/profile/widget/user_status.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:audio_school/api/api.dart';
import '../view/register_page.dart';

// const API_URL = 'http://localhost:3000/v1';
// // Define userData as a global variable
// Map<String, dynamic> userData = {};
// String? authToken;
// dynamic? token;

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  void setAuthToken(String token) {
    setState(() {
      authToken = token;
    });
  }

  String _errorMessage = '';
  Future<void> _loginUser() async {
    final email = emailController.text;
    final password = passwordController.text;
    final response = await http.post(
      Uri.parse('$API_URL/auth/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      token = jsonDecode(response.body)['tokens']['access']['token'];
      print(token);

      userData = await _fetchUserData(token as String);
      print(userData);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              NavPage(userData: userData as Map<String, dynamic>),
        ),
      );
    } else {
      // Define an initial value for userData
      Map<String, dynamic> userData = {};

      final bool isThemeDark = isDark(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: isThemeDark ? yellowMain : blueMain,
          content: Text(
            'Невірний логін або пароль!',
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

  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      backgroundColor: isThemeDark ? darkBG : lightBG,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 0),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 320,
              height: 70,
              child: isThemeDark
                  ? const Image(
                      image: AssetImage('assets/images/logo-dark.png'))
                  : const Image(image: AssetImage('assets/images/logo.png')),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Вхід',
            style: TextStyle(
                color: isThemeDark ? lightBG : blueMainDark,
                fontSize: 32,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16),
          Expanded(
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
                          controller: emailController,
                          cursorColor: isThemeDark ? yellowMain : blueMain,
                          decoration: InputDecoration(
                            hintText: 'Е-мейл',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: isThemeDark ? yellowMain : blueMain),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(accentColor: yellowMain),
                          child: TextFormField(
                            controller: passwordController,
                            cursorColor: isThemeDark ? yellowMain : blueMain,
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Будь ласка введіть пароль';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Пароль',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: isThemeDark ? yellowMain : blueMain),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: isThemeDark ? yellowMain : blueMain,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0),
                  _errorMessage.isNotEmpty
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16),
                            child: Text(
                              _errorMessage,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(height: 16),
                  SizedBox(
                    width: 326,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const NavPage(),
                        //   ),
                        // );
                        _loginUser();
                      },
                      child: Text(
                        'Увійти',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isThemeDark ? darkBG : lightBG),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isThemeDark ? yellowMain : blueMain,
                        minimumSize: Size(326, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Забули пароль?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isThemeDark ? yellowMain : blueMain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: isThemeDark ? greyNavDark : greyNavLight,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('АБО',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isThemeDark ? lightBG : blueMainDark,
                            )),
                      ),
                      Expanded(
                          child: Divider(
                        color: isThemeDark ? greyNavDark : greyNavLight,
                      )),
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const NavPage(
                            //       // user: user,
                            //       ,
                            //     ),
                            //   ),
                            // );
                          },
                          icon: Icon(
                            Icons.facebook,
                            color: isThemeDark ? darkBG : lightBG,
                          ),
                          label: Text('Вхід з Facebook',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isThemeDark ? darkBG : lightBG,
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isThemeDark ? greyLight : blueMainDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: Size(326, 48),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.abc,
                            color: isThemeDark ? darkBG : lightBG,
                          ),
                          label: Text('Вхід з Google',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isThemeDark ? darkBG : lightBG,
                              )),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor:
                                isThemeDark ? greyLight : blueMainDark,
                            minimumSize: Size(326, 48),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.apple,
                            color: isThemeDark ? darkBG : lightBG,
                          ),
                          label: Text('Вхід з Apple',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isThemeDark ? darkBG : lightBG,
                              )),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor:
                                isThemeDark ? greyLight : blueMainDark,
                            minimumSize: Size(326, 48),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Немає облікового запису? ',
                        style: TextStyle(
                          color: isThemeDark ? lightBG : blueMainDark,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Зареєструватись',
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
    );
  }
}
