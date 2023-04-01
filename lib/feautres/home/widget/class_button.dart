import 'package:audio_school/feautres/theme/theme_data.dart';
import 'package:flutter/material.dart';

class ClassButton extends StatefulWidget {
  const ClassButton({super.key});

  @override
  _ClassButtonState createState() => _ClassButtonState();
}

class _ClassButtonState extends State<ClassButton> {
  int _selectedIndex = 0;

  final List<String> _classList = [
    'Клас 1',
    'Клас 2',
    'Клас 3',
    'Клас 4',
    'Клас 5',
    'Клас 6',
    'Клас 7',
    'Клас 8',
    'Клас 9',
    'Клас 10',
    'Клас 11',
    'Клас 12',
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
                      Icons.school,
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
                        fontSize: 16.0,
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
