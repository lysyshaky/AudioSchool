import 'package:audio_school/feautres/home/widget/logo_title.dart';
import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:audio_school/feautres/library/view/library_view.dart';
import 'package:audio_school/feautres/library/widgets/library_text.dart';

import 'package:flutter/material.dart';

import '../widget/profile_text.dart';

class EmptyTabs extends StatelessWidget {
  final Widget tabName;

  const EmptyTabs({
    Key? key,
    required this.tabName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Scaffold(
      backgroundColor: isThemeDark ? darkBG : lightBG,
      appBar: AppBar(
        iconTheme: IconThemeData(color: isThemeDark ? lightBG : darkBG),
        backgroundColor: isThemeDark ? darkBG : lightBG,
        elevation: 0.0,
        centerTitle: false,
        title: tabName,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isThemeDark
              ? const Image(image: AssetImage('assets/images/logo-dark.png'))
              : const Image(image: AssetImage('assets/images/logo.png')),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    'Ця сторінка поки що пуста, але скоро тут буде багато цікавого!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: isThemeDark ? Colors.white : Colors.black,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
