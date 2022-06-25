import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/stories/garage/garage.dart';
import 'package:sandbox/stories/stories.dart';

void main() {
  final dashbook = Dashbook(theme: ThemeData.light());

  addCarStories(dashbook);
  addGarageStories(dashbook);
  addPlayerStories(dashbook);

  runApp(dashbook);
}
