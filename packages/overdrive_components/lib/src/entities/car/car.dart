import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

class Car extends Entity {
  Car()
      : super(
          size: _carSize,
          anchor: Anchor.center,
          children: [
            RectangleComponent.relative(_carSize, parentSize: _carSize)
              ..paint = _carPaint
          ],
        );

  static final _carSize = Vector2(10, 5);

  static final _carPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;
}
