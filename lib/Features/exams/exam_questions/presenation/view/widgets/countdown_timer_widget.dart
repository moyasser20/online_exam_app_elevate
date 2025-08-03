import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimerWidget extends StatefulWidget {
  final int totalMinutes;
  final VoidCallback onTimeOut;

  const CountdownTimerWidget({
    super.key,
    required this.totalMinutes,
    required this.onTimeOut,
  });

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late int remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.totalMinutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds <= 0) {
        timer.cancel();
        widget.onTimeOut();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Color getTextColor() {
    final halfTime = widget.totalMinutes * 60 ~/ 2;
    return remainingSeconds <= halfTime ? Colors.red : Colors.green;
  }

  String formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(remainingSeconds),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: getTextColor(),
      ),
    );
  }
}
