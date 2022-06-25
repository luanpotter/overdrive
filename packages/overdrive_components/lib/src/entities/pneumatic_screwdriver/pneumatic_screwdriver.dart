import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

class PneumaticScrewdriver extends Entity {
  PneumaticScrewdriver({
    required Vector2 position,
  }) : super(
          position: position,
          size: _pneumaticScrewdriverSize,
          children: [
            CircleComponent.relative(
              1,
              parentSize: _pneumaticScrewdriverSize,
            )..paint = _pneumaticScrewdriverPaint,
          ],
        );

  static final _pneumaticScrewdriverSize = Vector2(30, 30);
  static final _pneumaticScrewdriverPaint = Paint()..color = Colors.green;
}
