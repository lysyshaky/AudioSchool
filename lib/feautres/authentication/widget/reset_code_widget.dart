import 'package:audio_school/feautres/authentication/view/view.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ResetCodeWidget extends StatefulWidget {
  const ResetCodeWidget({Key? key}) : super(key: key);

  @override
  State<ResetCodeWidget> createState() => _ResetCodeWidgetState();
}

class _ResetCodeWidgetState extends State<ResetCodeWidget> {
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
                'Підтвердити код',
                style: TextStyle(
                    color: isThemeDark ? lightBG : blueMainDark,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.36,
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
                              'На вашу електронну адресу надіслано код автентифікації.',
                              style: TextStyle(
                                fontSize: 16,
                                color: isThemeDark ? lightBG : blueMainDark,
                              ),
                            ),
                            SizedBox(height: 16),
                            TextField(
                              cursorColor: isThemeDark ? yellowMain : blueMain,
                              style: TextStyle(
                                  color: isThemeDark ? darkBG : blueMainDark),
                              decoration: InputDecoration(
                                hintText: 'Ввести код',
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
                            'Підтвердити',
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
                      SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          // Add the SnackBar to display the message
                          final snackBar = SnackBar(
                            content: Text('Код було надіслано.',
                                style: TextStyle(
                                  color: isThemeDark ? darkBG : lightBG,
                                  fontSize: 16,
                                )),
                            backgroundColor:
                                isThemeDark ? yellowMain : blueMain,
                            duration: Duration(seconds: 1),
                          );

                          // Show the SnackBar using the ScaffoldMessenger
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          // Uncomment the following lines if you want to navigate to another page
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const RegisterPage(),
                          //   ),
                          // );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Не отримали код? ',
                            style: TextStyle(
                              color: isThemeDark ? lightBG : blueMainDark,
                              fontSize: 14,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Надіслати ще раз.',
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
