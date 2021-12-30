import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _isPlaying = false;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _currentSeconds = const Duration(milliseconds: 0);

  late AnimationController _controller;

  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_currentSeconds);

  double get percentage => (_songDuration.inSeconds >= 0)
      ? 0
      : _currentSeconds.inSeconds / _songDuration.inSeconds;

  set controller(AnimationController value) {
    _controller = value;
  }

  AnimationController get controller => _controller;

  bool get isPlaying => _isPlaying;

  set isPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;

  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  Duration get currentSeconds => _currentSeconds;

  set currentSeconds(Duration value) {
    _currentSeconds = value;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
