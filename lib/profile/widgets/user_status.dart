import 'package:flutter/material.dart';

import '../../feautres/theme/theme.dart';

class UserStatus extends StatelessWidget {
  final String userName;
  final String email;
  final bool isPremium;

  const UserStatus({
    Key? key,
    required this.userName,
    required this.email,
    this.isPremium = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.account_circle,
            size: 70,
            color: Colors.grey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isThemeDark ? lightBG : blueMainDark),
            ),
            SizedBox(height: 4),
            Text(
              email,
              style: TextStyle(
                fontSize: 14,
                color: greyNavLight,
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: greyNavLight, width: 1),
          ),
          child: Text(
            isPremium ? 'Premium' : 'Default',
            style: TextStyle(
              fontSize: 14,
              color: isPremium && isThemeDark
                  ? yellowMain
                  : !isThemeDark && isPremium
                      ? blueMain
                      : greyNavLight,
            ),
          ),
        ),
        SizedBox(width: 12),
      ],
    );
  }
}
