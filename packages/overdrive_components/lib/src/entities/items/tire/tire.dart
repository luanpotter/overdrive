import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

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
  Tire._({required TireStatus status, Vector2? position})
      : super(
          size: tireSize,
          anchor: Anchor.center,
          position: position,
          children: [
            CircleComponent.relative(1, parentSize: tireSize)
              ..paint = status.toPaint(),
          ],
        );

  Tire.normal({Vector2? position})
      : this._(status: TireStatus.normal, position: position);

  Tire.damaged({Vector2? position})
      : this._(status: TireStatus.damaged, position: position);

  static final tireSize = Vector2(20, 20);
}
