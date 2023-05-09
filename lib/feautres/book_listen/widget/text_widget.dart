import 'package:flutter/material.dart';

import '../../theme/theme_data.dart';

class TextContainer extends StatefulWidget {
  final VoidCallback onClose;
  TextContainer({required this.onClose});
  @override
  _TextContainerState createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Container(
      decoration: BoxDecoration(
        color: isThemeDark ? blueMainDark : blueMain.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12), // Set border radius here
      ),

      // Container attributes such as padding, color, etc.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Читання',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isThemeDark ? lightBG : blueMainDark,
                  ),
                  // Style for the header
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close,
                      color: isThemeDark ? lightBG : blueMainDark),
                  onPressed: widget.onClose,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '''Далеко далеко, за горами слова, далеко від країн Vokalia і Consonantia живуть сліпі тексти. Розділені вони живуть у Bookmarksgrove прямо на узбережжі Семантики, великого мовного океану. Невелика річка на ім'я Дуден протікає біля їхнього місця і постачає його необхідними регеліяліями. Це райська країна, в якій засмажені частини речень летять до рота.''',
              // Style for the text
              style: TextStyle(
                fontSize: 16,
                color: isThemeDark ? lightBG : blueMainDark,
              ),
              // Your text color),
            ),
          ],
        ),
      ),
    );
  }
}
