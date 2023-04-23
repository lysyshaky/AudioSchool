import 'package:audio_school/feautres/book_listen/widget/common.dart';
import 'package:audio_school/feautres/home/home.dart';
import 'package:audio_school/feautres/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:ui' as ui;

import 'package:rxdart/rxdart.dart';

import '../../theme/theme_data.dart';

int index = 0;
final List<Map<String, String>> books = [
  {
    'image': '/Users/yuralysyshak/Documents/audio_school/assets/test.png',
    'title': 'Історія України',
    'author': 'О.В. Матринюк',
    'listenTime': '30 хв',
    'readTime': '45 хв',
    'description':
        'Історія України 10 клас, книга описує події в історії України 19-20 століття. Тут ви дізнаєтесь про основні бої і в чиїх руках на цей час була ненька Україна та багато інших цікавих фак...'
  },
  // Add more books here
];

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
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
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

  @override
  Widget build(BuildContext context) {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavPage()),
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
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

// Displays the play/pause button and volume/speed sliders.
class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isThemeDark = isDark(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opens volume slider dialog
        // PopupMenuButton<double>(
        //   icon: Icon(Icons.volume_up, color: isThemeDark ? lightBG : darkBG),
        //   onSelected: (double value) {
        //     player.setVolume(value);
        //   },
        //   itemBuilder: (BuildContext context) {
        //     return List<PopupMenuEntry<double>>.generate(
        //       6,
        //       (int index) => PopupMenuItem<double>(
        //         value: index / 10,
        //         child: Text("Гучнісь: ${index * 20}%"),
        //       ),
        //     );
        //   },
        // ),
        SizedBox(width: 36),

        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: Icon(Icons.skip_previous_rounded,
                color: isThemeDark ? lightBG : blueMainDark),
            onPressed: player.hasPrevious ? player.seekToPrevious : null,
            iconSize: 48.0,
          ),
        ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;

            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: CircularProgressIndicator(
                  color: isThemeDark ? yellowMain : blueMain,
                ),
              );
              //   else if () {
              //   return IconButton(
              //     icon: const Icon(Icons.skip_next_rounded, color: Colors.white),
              //     iconSize: 64.0,
              //     onPressed: player.play,
              //   );
              // } else if () {
              //   return IconButton(
              //     icon: const Icon(Icons.skip_previous_rounded,
              //         color: Colors.white),
              //     iconSize: 64.0,
              //     onPressed: player.play,
              //   );
              // }
            } else if (playing != true) {
              return IconButton(
                icon: Icon(Icons.play_arrow_rounded,
                    color: isThemeDark ? lightBG : darkBG),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: Icon(Icons.pause_rounded,
                    color: isThemeDark ? lightBG : blueMainDark),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: Icon(Icons.replay,
                    color: isThemeDark ? lightBG : blueMainDark),
                iconSize: 64.0,
                onPressed: () => player.seek(Duration.zero),
              );
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: Icon(
              Icons.skip_next_rounded,
              color: isThemeDark ? lightBG : blueMainDark,
            ),
            iconSize: 48.0,
            onPressed: player.hasNext ? player.seekToNext : null,
          ),
        ),
        SizedBox(width: 30),
        // Opens speed slider dialog
        PopupMenuButton<double>(
          child: StreamBuilder<double>(
            stream: player.speedStream,
            builder: (context, snapshot) => Text(
              "${snapshot.data?.toStringAsFixed(1)}x",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isThemeDark ? lightBG : blueMainDark),
            ),
          ),
          onSelected: (double value) {
            player.setSpeed(value);
          },
          itemBuilder: (BuildContext context) {
            return List<PopupMenuEntry<double>>.generate(
              4,
              (int index) => PopupMenuItem<double>(
                value: 0.5 * (index + 1),
                child: Text(
                    "Швидкість: ${(0.5 * (index + 1)).toStringAsFixed(1)}x"),
              ),
            );
          },
        ),
      ],
    );
  }
}
