import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String getTime() {
  DateTime now = DateTime.now();
  String time = DateFormat.Hm().format(now).toString();
  return time;
}

String getDate() {
  DateTime now = DateTime.now();
  String date = DateFormat('EEEE | MMMM d').format(now).toString();
  return date;
}

String getDay1() {
  Duration day = Duration(days: 1);
  DateTime now = DateTime.now();
  String date = DateFormat('E d').format(now.add(day)).toString();
  return date;
}

String getDay2() {
  Duration day = Duration(days: 2);
  DateTime now = DateTime.now();
  String date = DateFormat('E d').format(now.add(day)).toString();
  return date;
}

String getDay3() {
  Duration day = Duration(days: 3);
  DateTime now = DateTime.now();
  String date = DateFormat('E d').format(now.add(day)).toString();
  return date;
}

String getDay4() {
  Duration day = Duration(days: 4);
  DateTime now = DateTime.now();
  String date = DateFormat('E d').format(now.add(day)).toString();
  return date;
}
