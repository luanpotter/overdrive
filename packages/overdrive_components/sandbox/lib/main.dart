import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/stories/car/car.dart';

void main() {
  final dashbook = Dashbook(theme: ThemeData.light());

  addCarStories(dashbook);

  runApp(dashbook);
}
