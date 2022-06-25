import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/overdrive_components.dart';

export 'behaviors/behaviors.dart';

enum CarStatus {
  damaged,
  repaired,
}

class Car extends Entity {
  Car._({
    required this.status,
    Vector2? position,
    Iterable<Behavior>? behaviors,
  }) : super(
          size: _carSize,
          anchor: Anchor.center,
          position: position,
          children: [
            RectangleComponent.relative(Vector2.all(1), parentSize: _carSize)
              ..paint = _carPaint,
          ],
          behaviors: behaviors,
        );

  Car.damaged({Vector2? position, Iterable<Behavior>? behaviors})
      : this._(
          status: CarStatus.damaged,
          position: position,
          behaviors: behaviors,
        );

  Car.repaired({Vector2? position, Iterable<Behavior>? behaviors})
      : this._(
          status: CarStatus.repaired,
          position: position,
          behaviors: behaviors,
        );

  final velocity = Vector2(200, 0);
  final CarStatus status;

  static final _carSize = Vector2(75, 30);

  static final _carPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;

  @override
  Future<void>? onLoad() {
    final leftTirePosition = Vector2(Tire.tireSize.x / 2, _carSize.y);
    final rightTirePosition = Vector2(
      _carSize.x - (Tire.tireSize.x / 2),
      _carSize.y,
    );
    switch (status) {
      case CarStatus.damaged:
        add(Tire.damaged(position: leftTirePosition));
        add(Tire.normal(position: rightTirePosition));
        break;

      case CarStatus.repaired:
        add(Tire.normal(position: leftTirePosition));
        add(Tire.normal(position: rightTirePosition));
        break;
    }
    return super.onLoad();
  }
}
