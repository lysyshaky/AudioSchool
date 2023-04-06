import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class LibraryButton extends StatefulWidget {
  const LibraryButton({super.key});

  @override
  _LibraryButtonState createState() => _LibraryButtonState();
}

class _LibraryButtonState extends State<LibraryButton> {
  int _selectedIndex = 0;

  final List<String> _classList = [
    'Збережені книги',
    'В процесі',
    'Завершені',
  ];

  final List<IconData> _classIcons = [
    Icons.bookmark_border_rounded,
    // Icons.bookmark,
    Icons.timer_outlined,
    Icons.check_circle_outline,
  ];

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return SizedBox(
      height: 42.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _classList.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 12.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isThemeDark
                    ? _selectedIndex == index
                        ? yellowMain
                        : darkBG
                    : _selectedIndex == index
                        ? blueMain
                        : lightBG,
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                border: Border.all(
                  color: isThemeDark
                      ? _selectedIndex == index
                          ? darkBG
                          : greyMain
                      : _selectedIndex == index
                          ? lightBG
                          : blueMainDark,
                  width: 2.0,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      _classIcons[
                          index], // use the icon at the same index as the text
                      color: isThemeDark
                          ? _selectedIndex == index
                              ? blueMain
                              : Colors.white
                          : _selectedIndex == index
                              ? yellowMain
                              : blueMainDark,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      _classList[index],
                      style: TextStyle(
                        color: isThemeDark
                            ? _selectedIndex == index
                                ? blueMain
                                : Colors.white
                            : _selectedIndex == index
                                ? yellowMain
                                : blueMainDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
