import 'package:audio_school/feautres/authentication/view/view.dart';
import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../view/register_page.dart';

class NewPasswordWidget extends StatefulWidget {
  const NewPasswordWidget({Key? key}) : super(key: key);

  @override
  State<NewPasswordWidget> createState() => _NewPasswordWidgetState();
}

class _NewPasswordWidgetState extends State<NewPasswordWidget> {
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
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
            'Встановіть пароль',
            style: TextStyle(
                color: isThemeDark ? lightBG : blueMainDark,
                fontSize: 32,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
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
                      Icon(
                        Icons.check_circle_outline,
                        color: isThemeDark ? yellowMain : blueMain,
                        size: 64,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Код перевірено',
                        style: TextStyle(
                          color: isThemeDark ? lightBG : blueMainDark,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Theme(
                        data:
                            Theme.of(context).copyWith(accentColor: yellowMain),
                        child: TextFormField(
                          cursorColor: isThemeDark ? yellowMain : blueMain,
                          obscureText: _obscureText,
                          style: TextStyle(
                              color: isThemeDark ? darkBG : blueMainDark),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Будь ласка введіть пароль';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Новий пароль',
                            hintStyle: TextStyle(
                                color: isThemeDark ? darkBG : blueMainDark),
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
                      SizedBox(height: 16),
                      Theme(
                        data:
                            Theme.of(context).copyWith(accentColor: yellowMain),
                        child: TextFormField(
                          cursorColor: isThemeDark ? yellowMain : blueMain,
                          obscureText: _obscureText,
                          style: TextStyle(
                              color: isThemeDark ? darkBG : blueMainDark),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Будь ласка введіть пароль';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Повторіть пароль',
                            hintStyle: TextStyle(
                                color: isThemeDark ? darkBG : blueMainDark),
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
                SizedBox(height: 24),
                SizedBox(
                  width: 326,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Змінити пароль',
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
