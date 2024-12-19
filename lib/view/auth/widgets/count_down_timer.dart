import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final int startTimeMilliseconds;
  final Function()? onTimerFinish;
  final TextStyle? textStyle;
  final bool day;
  final bool hour;
  final bool min;
  final bool sec;
  final String dayString;
  final String hourString;
  final String minString;
  final String secString;
  final bool verificationPage;

  const CountDownTimer({
    super.key,
    required this.startTimeMilliseconds,
    this.onTimerFinish,
    this.textStyle,
    this.verificationPage = false,
    this.day = true,
    this.hour = true,
    this.min = true,
    this.sec = true,
    this.dayString = "d",
    this.hourString = "h",
    this.minString = "m",
    this.secString = "s",
  });

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

    String twoDigitDays = twoDigits(duration.inDays);
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    String time = "";
    if (widget.verificationPage) {
      return '${twoDigitMinutes}m : ${twoDigitSeconds}s';
    } else {
      if (widget.day) time += "$twoDigitDays ${widget.dayString}";
      if (widget.day && widget.hour) time += " : ";
      if (widget.hour) time += "$twoDigitHours ${widget.hourString}";
      if (widget.min) time += " : ";
      if (widget.min) time += "$twoDigitMinutes ${widget.minString}";
      if (widget.sec) time += " : ";
      if (widget.sec) time += "$twoDigitSeconds ${widget.secString}";
    }
    return time;
  }

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(milliseconds: _remainingMilliseconds);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formatDuration(duration),
          style: widget.textStyle ?? Theme.of(context).textTheme.bodySmall,
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
