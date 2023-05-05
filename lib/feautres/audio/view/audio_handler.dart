import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class CustomAudioHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  CustomAudioHandler() {
    _init();
  }

  Future<void> _init() async {
    _player.playbackEventStream.listen((event) {
      final playing = _player.playing;
      playbackState.add(
        playbackState.value.copyWith(
          playing: playing,
          processingState: playing
              ? AudioProcessingState.ready
              : AudioProcessingState.buffering,
          updatePosition: event.updatePosition,
        ),
      );
    });

    _player.currentIndexStream.listen((index) {
      if (index != null) {
        mediaItem.add(queue.value[index!]);
      }
    });

    try {
      // Replace this URL with your own audio file
      final url =
          'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3';
      await _player.setUrl(url);
      queue.add([
        MediaItem(
          id: '1',
          title: 'Your Audio Title',
          album: 'Your Album',
          artist: 'Your Artist',
          duration: _player.duration,
        ),
      ]);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> seek(Duration position) => _player.seek(position);
}

class CustomAudioHandlerTask extends BackgroundAudioTask {
  final CustomAudioHandler _audioHandler = CustomAudioHandler();

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    await _audioHandler.play();
  }

  @override
  Future<void> onStop() async {
    await _audioHandler.stop();
    await super.onStop();
  }
}

void startAudioService() async {
  await AudioService.start(
    backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
    androidNotificationChannelName: 'My Channel',
    androidNotificationIcon: 'mipmap/ic_launcher',
  );
}

void _audioPlayerTaskEntrypoint() {
  AudioServiceBackground.run(() => CustomAudioHandlerTask());
}
