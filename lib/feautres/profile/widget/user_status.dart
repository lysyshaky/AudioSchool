import 'package:audio_school/feautres/authentication/widget/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../api/api.dart';
import '../../authentication/provider/login_helper.dart';
import '../../authentication/widget/login_widget.dart' as ll;
import '../../theme/theme_data.dart';

class UserStatus extends StatefulWidget {
  final String authToken;
  final bool isPremium;

  UserStatus({
    Key? key,
    required this.authToken,
    this.isPremium = false,
    required Map<String, dynamic> userData,
  }) : super(key: key);

  @override
  State<UserStatus> createState() => _UserStatusState();
}

class _UserStatusState extends State<UserStatus> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadData();
    _fetchUserData(widget.authToken);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _fetchUserData(widget.authToken);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _fetchUserData(widget.authToken);
    if (state == AppLifecycleState.resumed) {
      // user returned to our app
      _loadData();
    } else if (state == AppLifecycleState.inactive) {
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user is about quit our app temporally
    } else if (state == AppLifecycleState.detached) {
      // app suspended (not used in iOS)
    }
  }

  Future<Map<String, dynamic>> _fetchUserData(String token) async {
    final response = await http.get(
      Uri.parse('$API_URL/users/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<void> _loadData() async {
    final isLoggedIn = await LoginHelper().getIsUserLoggedIn();
    if (isLoggedIn) {
      final token = await LoginHelper().getApiToken();
      if (token != null) {
        final fetchedUserData = await _fetchUserDataInit(token);
        setState(() {
          userData = fetchedUserData;
        });
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => NavPage(
        //       userData: userData!,
        //       apiToken: token!,
        //     ),
        //   ),
        // );
      }
    }
  }

  Future<Map<String, dynamic>> _fetchUserDataInit(String token) async {
    final response = await http.get(
      Uri.parse('$API_URL/users/me'),
      headers: {'Authorization': 'Bearer ${widget.authToken}'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    var avatarUrl = userData['avatar'];
    //remove this for use image from api
    avatarUrl = 'https://i.ibb.co/5GVLX02/test.png';
    final bool isThemeDark = isDark(context);
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchUserData(widget.authToken),
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
                  child: avatarUrl != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(avatarUrl as String),
                          radius: 35,
                        )
                      : Icon(
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
                    widget.isPremium ? 'Premium' : 'Default',
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.isPremium && isThemeDark
                          ? yellowMain
                          : !isThemeDark && widget.isPremium
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
