import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';

import '../../theme/theme_data.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
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
            // Image.asset(
            //   'assets/images/test.png',
            //   fit: BoxFit.cover,
            //   height: 60,
            // ),
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
                                    color: isThemeDark ? lightBG : lightBG,
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
                          trackHeight: 4.0, // Change the height of the track
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
                              final position = snapshot.data ?? Duration.zero;
                              final duration =
                                  AudioService.currentMediaItem?.duration ??
                                      Duration.zero;
                              return Slider(
                                value: position.inMilliseconds.toDouble(),
                                min: 0.0,
                                max: duration.inMilliseconds.toDouble(),
                                onChanged: (newValue) {
                                  AudioService.seekTo(
                                      Duration(milliseconds: newValue.toInt()));
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StreamBuilder<MediaItem?>(
                              stream: AudioService.currentMediaItemStream,
                              builder: (context, snapshot) {
                                final duration =
                                    snapshot.data?.duration ?? Duration.zero;
                                return Text(
                                  '${duration.toString().split('.').first}',
                                  style: TextStyle(color: Colors.white),
                                );
                              },
                            ),
                            StreamBuilder<Duration?>(
                              stream: AudioService.positionStream,
                              builder: (context, snapshot) {
                                final position = snapshot.data ?? Duration.zero;
                                return Text(
                                  '${position.toString().split('.').first}',
                                  style: TextStyle(color: Colors.white),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                final state = snapshot.data?.processingState ??
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
    );
  }
}
