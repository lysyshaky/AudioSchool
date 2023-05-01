import 'package:audio_school/feautres/authentication/widget/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../api/api.dart';
import '../../authentication/widget/login_widget.dart' as ll;
import '../../theme/theme_data.dart';

class UserStatus extends StatelessWidget {
  final String? authToken;
  final bool isPremium;

  UserStatus({
    Key? key,
    this.authToken,
    this.isPremium = false,
    required Map<String, dynamic> userData,
  }) : super(key: key);

  Future<Map<String, dynamic>> _fetchUserData(String token) async {
    final response = await http.get(
      Uri.parse('$API_URL/users/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchUserData(token as String),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Failed to load user data.');
          } else {
            final userData = snapshot.data!;
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
                      '${userData['name']}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isThemeDark ? lightBG : blueMainDark),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${userData['email']}',
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
        } else {
          return CircularProgressIndicator(
            color: isThemeDark ? yellowMain : blueMain,
          );
        }
      },
    );
  }
}
