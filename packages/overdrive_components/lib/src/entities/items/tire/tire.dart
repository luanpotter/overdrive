import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/src/entities/car/car.dart';
import 'package:overdrive_components/src/entities/car/car_body_component.dart';
import 'package:overdrive_components/src/entities/items/tire/tire_body_component.dart';

enum TireStatus {
  normal(),
  damaged();

  const TireStatus();

  Paint toPaint() {
    switch (this) {
      case TireStatus.normal:
        return _normalTirePaint;
      case TireStatus.damaged:
        return _damagedTirePaint;
    }
  }
}

final _normalTirePaint = Paint()
  ..color = Colors.black
  ..style = PaintingStyle.fill;

final _damagedTirePaint = Paint()
  ..color = Colors.red
  ..style = PaintingStyle.fill;

class Tire extends Entity {
  final TireStatus status;

  Tire({
    required this.status,
    required Vector2 position,
    required bool physics,
  }) : super(
          size: tireSize,
          anchor: Anchor.center,
          position: position,
          children: [
            CircleComponent.relative(1, parentSize: tireSize)
              ..paint = status.toPaint(),
            if (physics) TireBodyComponent(startPosition: position),
          ],
        );

  Tire.normal({required Vector2 position, required bool physics})
      : this(
          status: TireStatus.normal,
          position: position,
          physics: physics,
        );

  Tire.damaged({required Vector2 position, required bool physics})
      : this(
          status: TireStatus.damaged,
          position: position,
          physics: physics,
        );

  Car? get car => (parent as CarBodyComponent?)?.parent;

  static const tireRadius = 2.0;
  static final tireSize = Vector2.all(2 * tireRadius);
}
