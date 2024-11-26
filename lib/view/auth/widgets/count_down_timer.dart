import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final int startTimeMilliseconds;
  final Function()? onTimerFinish;

  const CountDownTimer({super.key, required this.startTimeMilliseconds, this.onTimerFinish});

  @override
  CountDownTimerState createState() => CountDownTimerState();
}

class CountDownTimerState extends State<CountDownTimer> {
  late Timer _timer;
  int _remainingMilliseconds = 0;

  @override
  void initState() {
    super.initState();
    _remainingMilliseconds = widget.startTimeMilliseconds - DateTime.now().millisecondsSinceEpoch;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingMilliseconds -= 1000;

        // Timer finished
        if (_remainingMilliseconds <= 0) {
          _timer.cancel();

          if (widget.onTimerFinish != null) {
            widget.onTimerFinish!();
          }
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(milliseconds: _remainingMilliseconds);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formatDuration(duration),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
