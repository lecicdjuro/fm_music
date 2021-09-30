import 'package:flutter/foundation.dart';
import 'dart:async';

class DebounceTimer {
  DebounceTimer({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  run(VoidCallback action) {
    _cancelTimer();

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  void dispose() {
    _cancelTimer();
  }
}
