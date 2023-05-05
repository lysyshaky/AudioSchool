import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerTask extends BackgroundAudioTask {
  final _player = AudioPlayer();

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    final url = params?['url'] as String?;

    if (url != null) {
      final mediaItem = MediaItem(id: url, album: '', title: '', artist: '');
      await _player.setAudioSource(AudioSource.uri(Uri.parse(url)));
      AudioServiceBackground.setMediaItem(mediaItem);
      _player.playbackEventStream.listen((event) {
        _broadcastState();
      });
    }
  }

  @override
  Future<void> onStop() async {
    await _player.dispose();
    await super.onStop();
  }

  @override
  Future<void> onPlay() async {
    _player.play();
  }

  @override
  Future<void> onPause() async {
    _player.pause();
  }

  void _broadcastState() {
    final playing = _player.playing;
    final processingState = {
      ProcessingState.idle: AudioProcessingState.idle,
      ProcessingState.loading: AudioProcessingState.loading,
      ProcessingState.buffering: AudioProcessingState.buffering,
      ProcessingState.ready: AudioProcessingState.ready,
      ProcessingState.completed: AudioProcessingState.completed,
    }[_player.processingState];
    final position = _player.position;

    AudioServiceBackground.setState(
      controls: [
        MediaControl.pause,
        MediaControl.play,
        MediaControl.stop,
      ],
      systemActions: [
        MediaAction.seek,
      ],
      // androidCompactActionIndices: const [0, 1, 2],
      playing: playing,
      processingState: processingState,
      position: position,
    );
  }
}
