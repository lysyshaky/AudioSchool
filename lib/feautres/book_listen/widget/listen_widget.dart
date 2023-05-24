import 'dart:convert';

import 'package:audio_school/feautres/book_listen/widget/common.dart';
import 'package:audio_school/feautres/book_listen/widget/text_widget.dart';
import 'package:audio_school/feautres/book_read/view/read_page.dart';
import 'package:audio_school/feautres/home/home.dart';
import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'dart:ui' as ui;

import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import '../../../api/api.dart';
import '../../authentication/provider/login_helper.dart';
import '../../authentication/widget/login_widget.dart';
import '../../theme/theme_data.dart';
import 'controll_buttons.dart';

int index = 0;
final List<Map<String, String>> books = [
  {
    'image': 'assets/images/test.png',
    'title': 'Історія України',
    'author': 'О.В. Матринюк',
    'listenTime': '30 хв',
    'readTime': '45 хв',
    'description':
        'Історія України 10 клас, книга описує події в історії України 19-20 століття. Тут ви дізнаєтесь про основні бої і в чиїх руках на цей час була ненька Україна та багато інших цікавих фак...'
  },
  // Add more books here
];
bool _isTextContainerVisible = false;

class PlayScreen extends StatefulWidget {
  PlayScreen({
    super.key,
    // required this.title,
    // required this.book,
    // required this.author,
    // required this.image,
  });
  // final String title;
  // final String book;
  // final String author;
  // final String image;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> with WidgetsBindingObserver {
  final _player = AudioPlayer();

  @override
  void initState() {
    _loadData();
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    // Inside the _init() method
    try {
      await _player.setAudioSource(AudioSource.uri(
        Uri.parse(
            "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3"),
        tag: MediaItem(
          // Specify a unique ID for each media item:
          id: '1',
          // Metadata to display in the notification:
          album: "О.В. Мартинюк",
          title: "Історія України",
          artUri: Uri.parse('https://i.ibb.co/4gWtSrt/test.png'),
        ),
      ));
    } catch (e) {
      print("Error loading audio source: $e");
    }

// Inside the initState() method
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
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
        final fetchedUserData = await _fetchUserData(token);
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

  @override
  Widget build(BuildContext context) {
    void _toggleTextContainerVisibility() {
      setState(() {
        _isTextContainerVisible = !_isTextContainerVisible;
      });
    }

    final bool isThemeDark = isDark(context);
    return Scaffold(
      backgroundColor: isThemeDark ? darkBG : lightBG,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: isThemeDark ? lightBG : blueMainDark,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 36,
          ),
          onPressed: () {
            //make it faster
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavPage(
                  userData: userData!,
                  apiToken: token as String,
                ),
              ),
            );
          },
        ),
        elevation: 0,
        backgroundColor: isThemeDark ? darkBG : lightBG,
        title: Text(
          '§1. Вступ',
          style: TextStyle(
            color: isThemeDark ? lightBG : blueMainDark,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.format_align_left,
                color: isThemeDark ? lightBG : blueMainDark),
            onPressed: () {
              _toggleTextContainerVisibility();
              // Implement your functionality for showing text here.
            },
          ),
          IconButton(
            icon: Icon(Icons.book_rounded,
                color: isThemeDark ? lightBG : blueMainDark),
            onPressed: () {
              // With this line
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookReadPage(userData: userData)));
              // Implement your functionality for showing text here.
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          children: [
            Image.asset(
              books[index]['image']!,
              fit: BoxFit.cover,
              height: 350, // 350
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Container(
              height: 350, // 350
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    isThemeDark
                        ? Colors.black.withOpacity(0.2)
                        : Colors.white.withOpacity(0.2),
                    isThemeDark
                        ? Colors.black.withOpacity(0.4)
                        : Colors.white.withOpacity(0.4),
                    isThemeDark
                        ? Colors.black.withOpacity(0.6)
                        : Colors.white.withOpacity(0.6),
                    isThemeDark
                        ? Colors.black.withOpacity(0.8)
                        : Colors.white.withOpacity(0.8),
                  ],
                ),
              ),
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 300,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              books[index]['image']!,
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      Row(
                        children: [
                          Text(
                            books[index]['title']!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: isThemeDark ? lightBG : blueMainDark),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            books[index]['author']!,
                            style: TextStyle(
                                fontSize: 18,
                                color: isThemeDark ? lightBG : blueMainDark),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 24,
                      ),
                      ControlButtons(_player),
                      // Display seek bar. Using StreamBuilder, this widget rebuilds
                      // each time the position, buffered position or duration changes.
                      StreamBuilder<PositionData>(
                        stream: _positionDataStream,
                        builder: (context, snapshot) {
                          final positionData = snapshot.data;
                          return SeekBar(
                            duration: positionData?.duration ?? Duration.zero,
                            position: positionData?.position ?? Duration.zero,
                            bufferedPosition:
                                positionData?.bufferedPosition ?? Duration.zero,
                            onChangeEnd: _player.seek,
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      if (_isTextContainerVisible)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: TextContainer(
                            onClose: () {
                              _toggleTextContainerVisibility();
                            },
                          ),
                        ),
                      SizedBox(height: 16),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
