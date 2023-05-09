import 'dart:async';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioTask extends BackgroundAudioTask {
  final _player = AudioPlayer();
  AudioProcessingState? _skipState;
  late StreamSubscription<PlaybackEvent> _eventSubscription;

  @override
  Future<void> onStart(Map<String, dynamic>? params) async {
    // Load the audio source.
    await _player.setAudioSource(AudioSource.uri(Uri.parse(
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));

    // Start playing the loaded audio source.
    _player.play();

    // Broadcast the media item to the clients.
    AudioServiceBackground.setMediaItem(
      MediaItem(
        id: "1",
        album: "Album",
        title: "Title",
        artUri: Uri.parse("https://via.placeholder.com/150"),
      ),
    );

    // Listen to the state updates of the audio player.
    _eventSubscription = _player.playbackEventStream.listen((event) {
      _broadcastState();
    });

    _player.processingStateStream.listen((state) {
      switch (state) {
        case ProcessingState.completed:
          onStop();
          break;
        case ProcessingState.ready:
          _skipState = null;
          break;
        default:
          break;
      }
    });
  }

  @override
  Future<void> onStop() async {
    // Stop the audio player.
    await _player.stop();

    // Dispose the audio player.
    _player.dispose();

    // Cancel the event subscription.
    await _eventSubscription.cancel();

    // Broadcast that the audio playback has stopped.
    await AudioServiceBackground.setState(
      controls: [],
      processingState: AudioProcessingState.idle,
      playing: false,
    );
    // Shut down the background task
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

  @override
  Future<void> onSeekTo(Duration position) async {
    _player.seek(position);
  }

  void _broadcastState() {
    AudioServiceBackground.setState(
      controls: [
        MediaControl.skipToPrevious,
        _player.playing ? MediaControl.pause : MediaControl.play,
        MediaControl.skipToNext,
        MediaControl.stop,
      ],
      systemActions: [
        MediaAction.seekForward,
        MediaAction.seekBackward,
      ],
      processingState: {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      position: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
    );
  }
}
