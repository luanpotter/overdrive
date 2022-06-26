import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/overdrive_components.dart';

export 'behaviors/behaviors.dart';

enum CarStatus {
  damaged,
  repaired,
}

class Car extends Entity with HasGameRef {
  Car._({
    required this.lane,
    required this.status,
    Iterable<Behavior>? behaviors,
  }) : super(
          size: _carSize,
          anchor: Anchor.center,
          children: [
            RectangleComponent.relative(Vector2.all(1), parentSize: _carSize)
              ..paint = _carPaint,
          ],
          behaviors: behaviors,
        );

  Car.damaged({required int lane, Iterable<Behavior>? behaviors})
      : this._(
          lane: lane,
          status: CarStatus.damaged,
          behaviors: behaviors,
        );

  Car.repaired({required int lane, Iterable<Behavior>? behaviors})
      : this._(
          lane: lane,
          status: CarStatus.repaired,
          behaviors: behaviors,
        );

  final velocity = Vector2(20, 0);
  final CarStatus status;
  final int lane;

  static final _carSize = Vector2(7.5, 3) * 3;

  static final _carPaint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill;

  Vector2 _computeStartPosition() {
    return Vector2(
      -Car._carSize.x,
      (1.5 + 2 * lane) * gameRef.size.y / 5,
    );
  }

  @override
  Future<void>? onLoad() {
    position = _computeStartPosition();
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
