import 'package:dashbook/dashbook.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/stories/stories.dart';

void main() {
  final dashbook = Dashbook(theme: ThemeData.light());

  // updating flame assets prefix
  Flame.images.prefix = '';

  addCarStories(dashbook);
  addGarageStories(dashbook);
  addPlayerStories(dashbook);
  addTireFixerWorkbench(dashbook);
  addPneumaticScrewdiver(dashbook);
  addToolTableStories(dashbook);

  runApp(dashbook);
}
