import 'package:flutter/material.dart';

import '../../feautres/theme/theme_data.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isThemeDark ? greyNavLight : greyNavLight,
                  width: 1.0,
                ),
                color: isThemeDark ? greyMain : lightBG,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.search,
                      color: isThemeDark ? greySearch : blueMainDark),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      cursorColor: isThemeDark ? yellowMain : blueMain,
                      style: TextStyle(color: isThemeDark ? lightBG : darkBG),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Назва, автор або ключове слово',
                        hintStyle: TextStyle(
                            color: isThemeDark ? greySearch : blueMainDark),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
