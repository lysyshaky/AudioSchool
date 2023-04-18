import 'package:audio_school/feautres/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_data.dart';

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  TextEditingController _nameController =
      TextEditingController(text: 'Юрій Лисишак');
  TextEditingController _emailController =
      TextEditingController(text: 'yuralysyshak@gmail.com');

  TextEditingController _dateController =
      TextEditingController(text: '12.12.2020');
  DateTime? _selectedDate;

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
                      '/Users/yuralysyshak/Documents/audio_school/assets/test.png'), // Replace with actual image
                ),
              ),
            ),

            // Change photo text
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Center(
                child: TextButton(
                  onPressed: () {
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

            SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 358,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Create the SnackBar with the appropriate colors
                    // Add the SnackBar to display the message
                    final snackBar = SnackBar(
                      content: Text('Ваші дані було збережено.',
                          style: TextStyle(
                            color: isThemeDark ? darkBG : lightBG,
                            fontSize: 16,
                          )),
                      backgroundColor: isThemeDark ? yellowMain : blueMain,
                      duration: Duration(seconds: 1),
                    );

                    // Show the SnackBar using the ScaffoldMessenger
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
