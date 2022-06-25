import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

class Tire extends Entity {
  Tire({Vector2? position, Iterable<Behavior>? behaviors})
      : super(
          size: tireSize,
          anchor: Anchor.center,
          position: position,
          children: [
            CircleComponent.relative(1, parentSize: tireSize)
              ..paint = _tirePaint,
          ],
          behaviors: behaviors,
        );

  static final tireSize = Vector2(20, 20);

  static final _tirePaint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.fill;
}
