import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

export 'behaviors/behaviors.dart';

class Car extends Entity {
  Car({Vector2? position, Iterable<Behavior>? behaviors})
      : super(
          size: _carSize,
          anchor: Anchor.center,
          position: position,
          children: [
            RectangleComponent.relative(_carSize, parentSize: _carSize)
              ..paint = _carPaint
          ],
          behaviors: behaviors,
        );

  final velocity = Vector2(200, 0);

  static final _carSize = Vector2(10, 5);

  static final _carPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;
}
