import 'package:audio_school/feautres/authentication/view/view.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({Key? key}) : super(key: key);

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
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
            'Відновити пароль',
            style: TextStyle(
                color: isThemeDark ? lightBG : blueMainDark,
                fontSize: 32,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16),
          Container(
            height: MediaQuery.of(context).size.height * 0.38,
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
                        Text(
                          'Забули свій пароль? Не хвилюйтеся, введіть свою електронну адресу, щоб скинути поточний пароль.',
                          style: TextStyle(
                            fontSize: 16,
                            color: isThemeDark ? lightBG : blueMainDark,
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
                            builder: (context) => const NewPasswordPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Надіслати код',
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
                  SizedBox(height: 16),
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
                            text: 'Зареєструватися',
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
