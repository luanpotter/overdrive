import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/overdrive_components.dart';

export 'behaviors/behaviors.dart';

class Car extends Entity {
  Car({Vector2? position, Iterable<Behavior>? behaviors})
      : super(
          size: _carSize,
          anchor: Anchor.center,
          position: position,
          children: [
            RectangleComponent.relative(Vector2.all(1), parentSize: _carSize)
              ..paint = _carPaint,
            Tire(position: Vector2(Tire.tireSize.x / 2, _carSize.y)),
            Tire(
              position: Vector2(_carSize.x - (Tire.tireSize.x / 2), _carSize.y),
            ),
          ],
          behaviors: behaviors,
        );

  final velocity = Vector2(200, 0);

  static final _carSize = Vector2(75, 30);

  static final _carPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;
}
