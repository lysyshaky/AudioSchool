import 'package:audio_school/api/api.dart';
import 'package:audio_school/feautres/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication/widget/login_widget.dart';
import '../../theme/theme_data.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  late Future<Map<String, dynamic>> _userDataFuture;
  TextEditingController _nameController = TextEditingController(
    text: '${userData!['name']}',
  );
  TextEditingController _emailController = TextEditingController(
    text: '${userData!['email']}',
  );

  TextEditingController _dateController =
      TextEditingController(text: '${userData!['dateOfBirth']}');
  DateTime? _selectedDate;
  Future<void> _updateUserData(Map<String, dynamic> userData) async {
    final response = await http.put(
      Uri.parse('$API_URL/users/me'),
      body: jsonEncode(userData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Show a success message to the user
      final bool isThemeDark = isDark(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Дані успішно збережено!',
            style: TextStyle(
              color: isThemeDark ? darkBG : lightBG,
              fontSize: 16,
            ),
          ),
          backgroundColor: isThemeDark ? yellowMain : blueMain,
        ),
      );
    } else {
      // Show an error message to the user
      final bool isThemeDark = isDark(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Не вдалось зберегти дані!',
            style: TextStyle(
              color: isThemeDark ? darkBG : lightBG,
              fontSize: 16,
            ),
          ),
          backgroundColor: isThemeDark ? yellowMain : blueMain,
        ),
      );
    }
  }

  Future<Map<String, dynamic>> _fetchUserData(String token) async {
    final response = await http.get(
      Uri.parse('$API_URL/users/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final userData = jsonDecode(response.body) as Map<String, dynamic>;
      _nameController.text = '${userData['name']}';
      _emailController.text = '${userData['email']}';
      _selectedDate = DateTime.tryParse('${userData['birthday']}' ?? '');
      if (_selectedDate != null) {
        _dateController.text =
            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      }
      return userData;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  void initState() {
    super.initState();
    _userDataFuture = _fetchUserData(token as String);
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // Fetch the user data here using the authToken
    // and update your controllers with the new data

    await _fetchUserData(token as String).then((userData) {
      setState(() {
        _nameController.text = '${userData!['name']}';
        _emailController.text = '${userData!['email']}';
        _selectedDate = DateTime.tryParse('${userData!['birhday']}' ?? '');
        if (_selectedDate != null) {
          _dateController.text =
              '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
        }
      });
    }).catchError((error) {
      print(error);
      // Show an error message to the user
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar
            Text(
              'Деталі профілю',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isThemeDark ? lightBG : blueMainDark),
            ),
            SizedBox(height: 24),

            // Profile picture
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle image picker here
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: isThemeDark ? yellowMain : blueMain,
                  backgroundImage: AssetImage(
                      'assets/images/test.png'), // Replace with actual image
                ),
              ),
            ),

            // Change photo text
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    print(token);
                    // Handle the button press here
                  },
                  child: Text(
                    'Змінити фото',
                    style: TextStyle(
                      fontSize: 16,
                      color: isThemeDark ? yellowMain : blueMain,
                    ),
                  ),
                ),
              ),
            ),

            // Divider
            Divider(
              height: 1,
              thickness: 1,
              color: isThemeDark ? greyMain : greyNavDark,
            ),

            // Text fields
            SizedBox(height: 24),
            TextField(
              style: TextStyle(color: isThemeDark ? lightBG : blueMainDark),
              cursorColor: isThemeDark ? yellowMain : blueMain,
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: isThemeDark ? yellowMain : blueMain),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: isThemeDark ? darkBG : lightBG),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: isThemeDark ? yellowMain : blueMain),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'ПІБ',
                labelStyle: TextStyle(
                    color: isThemeDark ? yellowMain : blueMain,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                filled: false,
              ),
            ),
            SizedBox(height: 24),
            TextField(
              style: TextStyle(color: isThemeDark ? lightBG : blueMainDark),
              cursorColor: isThemeDark ? yellowMain : blueMain,
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: isThemeDark ? yellowMain : blueMain),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: isThemeDark ? darkBG : lightBG),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: isThemeDark ? yellowMain : blueMain),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Е-мейл',
                labelStyle: TextStyle(
                    color: isThemeDark ? yellowMain : blueMain,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                filled: false,
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        primaryColor: isThemeDark ? yellowMain : blueMain,
                        accentColor: isThemeDark ? yellowMain : blueMain,
                        colorScheme: ColorScheme.light(
                          primary: isThemeDark ? yellowMain : blueMain,
                          onPrimary: Colors.white,
                          surface: isThemeDark ? yellowMain : blueMain,
                          onSurface: Colors.black,
                        ),
                        buttonTheme: ButtonThemeData(
                          textTheme: ButtonTextTheme.primary,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                    _dateController.text =
                        '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
                  });
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  style: TextStyle(color: isThemeDark ? lightBG : blueMainDark),
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isThemeDark ? yellowMain : blueMain),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: isThemeDark ? darkBG : lightBG),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isThemeDark ? yellowMain : blueMain),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: 'Дата народження',
                    hintText: 'Оберіть дату',
                    labelStyle: TextStyle(
                        color: isThemeDark ? yellowMain : blueMain,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            SizedBox(height: 48),
            Center(
              child: SizedBox(
                width: 358,
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> updatedUserData = {
                      'name': _nameController.text,
                      'email': _emailController.text,
                      'birthday': _selectedDate?.toIso8601String(),
                    };

                    // _fetchUserData(token);
                    // Update the user data
                    await _updateUserData(updatedUserData);
                    await _fetchUserData(token as String);
                    // Create the SnackBar with the appropriate colors
                    // Add the SnackBar to display the message

                    // Show the SnackBar using the ScaffoldMessenger

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ProfilePage(),
                    //   ),
                    // );
                  },
                  child: Text(
                    'Зберегти дані',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isThemeDark ? darkBG : lightBG,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isThemeDark ? yellowMain : blueMain,
                    minimumSize: Size(326, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
