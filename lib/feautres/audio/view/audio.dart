import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

import '../../theme/theme_data.dart';

// class MiniPlayer extends StatefulWidget {
//   const MiniPlayer({Key? key}) : super(key: key);

//   @override
//   _MiniPlayerState createState() => _MiniPlayerState();
// }

// class _MiniPlayerState extends State<MiniPlayer> {
//   @override
//   Widget build(BuildContext context) {
//     bool isThemeDark = isDark(context);
//     return Container(
//       height: 180,
//       color: isThemeDark ? darkBG : blueMainDark,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Stack(
//           children: [
//             // Image.asset(
//             //   'assets/images/test.png',
//             //   fit: BoxFit.cover,
//             //   height: 60,
//             // ),
//             Padding(
//               padding: const EdgeInsets.all(0.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       StreamBuilder<MediaItem?>(
//                         stream: AudioService.currentMediaItemStream,
//                         builder: (context, snapshot) {
//                           final mediaItem = snapshot.data;
//                           return Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Icon(Icons.multitrack_audio_rounded,
//                                   color: isThemeDark ? lightBG : lightBG),
//                               SizedBox(width: 8),
//                               Text(
//                                 'Зараз грає: ${mediaItem?.title ?? 'ТЕСТУВАННЯ'}',
//                                 style: TextStyle(
//                                     color: isThemeDark ? lightBG : lightBG,
//                                     fontSize: 16),
//                               ),
//                               // SizedBox(
//                               //     width:
//                               //         MediaQuery.of(context).size.width * 0.45),
//                             ],
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SliderTheme(
//                         data: SliderThemeData(
//                           thumbColor: isThemeDark
//                               ? yellowMain
//                               : blueMain, // Change the color of the thumb
//                           trackHeight: 4.0, // Change the height of the track
//                           activeTrackColor: isThemeDark
//                               ? Colors.yellow
//                               : Colors
//                                   .blue, //  // Change the color of the active part of the track
//                           inactiveTrackColor: isThemeDark
//                               ? Colors.yellow.shade100
//                               : Colors.blue
//                                   .shade100, // Change the color of the inactive part of the track
//                         ),
//                         child: Expanded(
//                           child: StreamBuilder<Duration?>(
//                             stream: AudioService.positionStream,
//                             builder: (context, snapshot) {
//                               final position = snapshot.data ?? Duration.zero;
//                               final duration =
//                                   AudioService.currentMediaItem?.duration ??
//                                       Duration.zero;
//                               return Slider(
//                                 value: position.inMilliseconds.toDouble(),
//                                 min: 0.0,
//                                 max: duration.inMilliseconds.toDouble(),
//                                 onChanged: (newValue) {
//                                   AudioService.seekTo(
//                                       Duration(milliseconds: newValue.toInt()));
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             StreamBuilder<MediaItem?>(
//                               stream: AudioService.currentMediaItemStream,
//                               builder: (context, snapshot) {
//                                 final duration =
//                                     snapshot.data?.duration ?? Duration.zero;
//                                 return Text(
//                                   '${duration.toString().split('.').first}',
//                                   style: TextStyle(color: Colors.white),
//                                 );
//                               },
//                             ),
//                             StreamBuilder<Duration?>(
//                               stream: AudioService.positionStream,
//                               builder: (context, snapshot) {
//                                 final position = snapshot.data ?? Duration.zero;
//                                 return Text(
//                                   '${position.toString().split('.').first}',
//                                   style: TextStyle(color: Colors.white),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 Icons.skip_previous_rounded,
//                                 size: 30,
//                               ),
//                               onPressed: () {
//                                 AudioService.skipToPrevious();
//                               },
//                               color: Colors.white,
//                             ),
//                             StreamBuilder<PlaybackState>(
//                               stream: AudioService.playbackStateStream,
//                               builder: (context, snapshot) {
//                                 final state = snapshot.data?.processingState ??
//                                     AudioProcessingState.idle;
//                                 final playing =
//                                     state == AudioProcessingState.ready &&
//                                         snapshot.data?.playing == true;
//                                 return IconButton(
//                                   icon: Icon(
//                                     playing
//                                         ? Icons.pause_rounded
//                                         : Icons.play_arrow_rounded,
//                                     size: 36,
//                                   ),
//                                   onPressed: () {
//                                     playing
//                                         ? AudioService.pause()
//                                         : AudioService.play();
//                                   },
//                                   color: Colors.white,
//                                 );
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(
//                                 Icons.skip_next_rounded,
//                                 size: 30,
//                               ),
//                               onPressed: () {
//                                 AudioService.skipToNext();
//                               },
//                               color: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// The background task class must be defined in a top-level function, not inside a class or an anonymous function.
void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerTask extends BackgroundAudioTask {
  final _player = AudioPlayer();

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    print("Starting audio task...");
    await _init();
    await onPlay();
    print("Audio task started");
  }

  Future<void> _init() async {
    // Setup the media item for your audio
    final item = MediaItem(
      id: 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
      album: 'Album 1',
      title: 'Track 1',
    );

    // Add the media item to a list
    List<MediaItem> mediaItems = [item];

    // Load and broadcast the queue
    await AudioServiceBackground.setQueue(mediaItems);
    AudioServiceBackground.setMediaItem(item);

    print("Initializing player...");
    try {
      // Load the audio into the player
      await _player.setUrl(item.id);
      print("Player initialized");
    } catch (e) {
      print("Error: $e");
    }
    // Specify the actions you want to support
    await AudioServiceBackground.setState(
      controls: [
        MediaControl.skipToPrevious,
        MediaControl.play,
        MediaControl.pause,
        MediaControl.stop,
        MediaControl.skipToNext
      ],
      systemActions: [MediaAction.seek],
      playing: true,
      processingState: AudioProcessingState.ready,
    );
  }

  @override
  Future<void> onStop() async {
    await _player.dispose();
    await super.onStop();
  }

  @override
  Future<void> onPlay() async {
    print("Playing...");
    await _player.play();
    print("Started playing");
  }

  @override
  Future<void> onPause() async {
    await _player.pause();
  }

  // Add other methods like stop, skipToNext, skipToPrevious, etc. as necessary
}

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  void initState() {
    super.initState();
    AudioService.start(
      backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
      androidNotificationChannelName: 'Audio Service Demo',
      // Enable this if you want the Android service to exit the foreground state on pause.
      //androidStopForegroundOnPause: true,
      androidNotificationColor: 0xFF2196f3,
      androidNotificationIcon: 'mipmap/ic_launcher',
      androidEnableQueue: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isThemeDark = isDark(context);
    return Container(
      height: 180,
      color: isThemeDark ? darkBG : blueMainDark,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... Your previous code ...
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder<MediaItem?>(
                              stream: AudioService.currentMediaItemStream,
                              builder: (context, snapshot) {
                                final mediaItem = snapshot.data;
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.multitrack_audio_rounded,
                                        color: isThemeDark ? lightBG : lightBG),
                                    SizedBox(width: 8),
                                    Text(
                                      'Зараз грає: ${mediaItem?.title ?? 'ТЕСТУВАННЯ'}',
                                      style: TextStyle(
                                          color:
                                              isThemeDark ? lightBG : lightBG,
                                          fontSize: 16),
                                    ),
                                    // SizedBox(
                                    //     width:
                                    //         MediaQuery.of(context).size.width * 0.45),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SliderTheme(
                              data: SliderThemeData(
                                thumbColor: isThemeDark
                                    ? yellowMain
                                    : blueMain, // Change the color of the thumb
                                trackHeight:
                                    4.0, // Change the height of the track
                                activeTrackColor: isThemeDark
                                    ? Colors.yellow
                                    : Colors
                                        .blue, //  // Change the color of the active part of the track
                                inactiveTrackColor: isThemeDark
                                    ? Colors.yellow.shade100
                                    : Colors.blue
                                        .shade100, // Change the color of the inactive part of the track
                              ),
                              child: Expanded(
                                child: StreamBuilder<Duration?>(
                                  stream: AudioService.positionStream,
                                  builder: (context, snapshot) {
                                    final position =
                                        snapshot.data ?? Duration.zero;
                                    final duration = AudioService
                                            .currentMediaItem?.duration ??
                                        Duration.zero;
                                    return Slider(
                                      value: position.inMilliseconds.toDouble(),
                                      min: 0.0,
                                      max: duration.inMilliseconds.toDouble(),
                                      onChanged: (newValue) {
                                        AudioService.seekTo(Duration(
                                            milliseconds: newValue.toInt()));
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  StreamBuilder<MediaItem?>(
                                    stream: AudioService.currentMediaItemStream,
                                    builder: (context, snapshot) {
                                      final duration =
                                          snapshot.data?.duration ??
                                              Duration.zero;
                                      return Text(
                                        '${duration.toString().split('.').first}',
                                        style: TextStyle(color: Colors.white),
                                      );
                                    },
                                  ),
                                  StreamBuilder<Duration?>(
                                    stream: AudioService.positionStream,
                                    builder: (context, snapshot) {
                                      final position =
                                          snapshot.data ?? Duration.zero;
                                      return Text(
                                        '${position.toString().split('.').first}',
                                        style: TextStyle(color: Colors.white),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.skip_previous_rounded,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      AudioService.skipToPrevious();
                                    },
                                    color: Colors.white,
                                  ),
                                  StreamBuilder<PlaybackState>(
                                    stream: AudioService.playbackStateStream,
                                    builder: (context, snapshot) {
                                      final state =
                                          snapshot.data?.processingState ??
                                              AudioProcessingState.idle;
                                      final playing =
                                          state == AudioProcessingState.ready &&
                                              snapshot.data?.playing == true;
                                      return IconButton(
                                        icon: Icon(
                                          playing
                                              ? Icons.pause_rounded
                                              : Icons.play_arrow_rounded,
                                          size: 36,
                                        ),
                                        onPressed: () {
                                          playing
                                              ? AudioService.pause()
                                              : AudioService.play();
                                        },
                                        color: Colors.white,
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.skip_next_rounded,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      AudioService.skipToNext();
                                    },
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
