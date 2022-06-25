import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

class TireFixerWorkbench extends Entity {
  TireFixerWorkbench({
    required Vector2 position,
  }) : super(
          position: position,
          size: _tireFixerWorkbenchSize,
          children: [
            RectangleComponent.relative(
              Vector2.all(1),
              parentSize: _tireFixerWorkbenchSize,
            )..paint = _tireFixerWorkbenchPaint,
          ],
        );

  static final _tireFixerWorkbenchSize = Vector2(60, 30);
  static final _tireFixerWorkbenchPaint = Paint()..color = Colors.red;
}
