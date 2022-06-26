import 'package:dashbook/dashbook.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/stories/stories.dart';
import 'package:sandbox/stories/title_animation/title_animation.dart';

void main() {
  final dashbook = Dashbook(theme: ThemeData.light());

  // updating flame assets prefix
  Flame.images.prefix = '';

  addCarSpriteStories(dashbook);
  addCarStories(dashbook);
  addGarageStories(dashbook);
  addPlayerStories(dashbook);
  addTireFixerWorkbench(dashbook);
  addPneumaticScrewdiver(dashbook);
  addToolTableStories(dashbook);
  addTitleAnimation(dashbook);

  runApp(dashbook);
}
