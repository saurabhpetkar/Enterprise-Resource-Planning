import 'package:flutter/material.dart';

class Meeting {
  final String topic;
  final String description;
  final int day;
  final String month;
  final int hour;
  final int minute;
  final String venue;

  Meeting({
    @required this.topic,
    @required this.description,
    @required this.day,
    @required this.month,
    @required this.minute,
    @required this.venue,
    @required this.hour,


  });
}
