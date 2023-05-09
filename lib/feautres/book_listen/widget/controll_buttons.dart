// Displays the play/pause button and volume/speed sliders.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../theme/theme_data.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayer _player;

  const ControlButtons(this._player, {Key? key}) : super(key: key);

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
          stream: _player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: Icon(Icons.skip_previous_rounded,
                color: isThemeDark ? lightBG : blueMainDark),
            onPressed: _player.hasPrevious ? _player.seekToPrevious : null,
            iconSize: 48.0,
          ),
        ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<PlayerState>(
          stream: _player.playerStateStream,
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
                onPressed: _player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: Icon(Icons.pause_rounded,
                    color: isThemeDark ? lightBG : blueMainDark),
                iconSize: 64.0,
                onPressed: _player.pause,
              );
            } else {
              return IconButton(
                icon: Icon(Icons.replay,
                    color: isThemeDark ? lightBG : blueMainDark),
                iconSize: 64.0,
                onPressed: () => _player.seek(Duration.zero),
              );
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: _player.sequenceStateStream,
          builder: (context, snapshot) => IconButton(
            icon: Icon(
              Icons.skip_next_rounded,
              color: isThemeDark ? lightBG : blueMainDark,
            ),
            iconSize: 48.0,
            onPressed: _player.hasNext ? _player.seekToNext : null,
          ),
        ),
        SizedBox(width: 30),
        // Opens speed slider dialog
        PopupMenuButton<double>(
          child: StreamBuilder<double>(
            stream: _player.speedStream,
            builder: (context, snapshot) => Text(
              "${snapshot.data?.toStringAsFixed(1)}x",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isThemeDark ? lightBG : blueMainDark),
            ),
          ),
          onSelected: (double value) {
            _player.setSpeed(value);
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
