import 'package:audio_school/feautres/authentication/view/view.dart';
import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../view/register_page.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavPage(),
                          ),
                        );
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
                          onPressed: () {},
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
