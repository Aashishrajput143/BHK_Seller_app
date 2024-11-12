import 'dart:async';
import 'package:flutter/material.dart';

class DealTimer extends StatefulWidget {
  final DateTime endTime;

  DealTimer({required this.endTime});

  @override
  _DealTimerState createState() => _DealTimerState();
}

class _DealTimerState extends State<DealTimer> {
  late Duration _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = widget.endTime.difference(DateTime.now());

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime = widget.endTime.difference(DateTime.now());

        if (_remainingTime.isNegative) {
          _timer.cancel();
          _remainingTime = Duration.zero;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'End In : ',
          style: const TextStyle(
            fontSize: 14.0,
          ),
        ),
        Text(
          _formatTime(_remainingTime),
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 3),
      ],
    );
  }
}
