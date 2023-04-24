import 'package:flutter/material.dart';

import '../../theme/theme_data.dart';

class TextSizeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Колір фону',
                    style: TextStyle(
                      color: isThemeDark ? lightBG : darkBG,
                      fontSize: 18,
                    )),
                Row(
                  children: [
                    Text(
                      '100%',
                      style: TextStyle(
                        color: isThemeDark ? lightBG : darkBG,
                        fontSize: 18,
                      ),
                    ), // Replace with actual text size percentage
                    SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300,
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Implement functionality for the minus button
                      },
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.remove, size: 24),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300,
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Implement functionality for the plus button
                      },
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.add, size: 24),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
