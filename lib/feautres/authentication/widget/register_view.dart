import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
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
          Container(
            alignment: Alignment.center,
            width: 320,
            height: 70,
            child: isThemeDark
                ? const Image(
                    image: AssetImage(
                        '/Users/yuralysyshak/Documents/audio_school/assets/logo-dark.png'))
                : const Image(
                    image: AssetImage(
                        '/Users/yuralysyshak/Documents/audio_school/assets/logo.png')),
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
                          cursorColor: isThemeDark ? yellowMain : blueMain,
                          decoration: InputDecoration(
                            hintText: 'Ім\'я та прізвище',
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
                      onPressed: () {},
                      child: Text(
                        'Створити обліковий запис',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isThemeDark ? darkBG : lightBG,
                        ),
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
                                  color: isThemeDark ? yellowMain : blueMain,
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
                                  color: isThemeDark ? yellowMain : blueMain,
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
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
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
    );
  }
}
