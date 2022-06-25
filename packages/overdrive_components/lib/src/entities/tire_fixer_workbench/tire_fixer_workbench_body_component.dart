import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/src/utils.dart';

class TireFixerWorkbenchBodyComponent extends BodyComponent
    with ParentIsA<TireFixerWorkbench> {
  static final size = Vector2(6, 3);

  final Vector2 startPosition;

  TireFixerWorkbenchBodyComponent({
    required this.startPosition,
  });

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _tireFixerWorkbenchPaint);
  }

  @override
  Body createBody() {
    final def = BodyDef()
      ..type = BodyType.kinematic
      ..position = startPosition;
    final body = world.createBody(def)..userData = this;

    final fixtureDef = FixtureDef(
      size.toRect().toPolygonShape(),
    )..restitution = 1.0;
    body.createFixture(fixtureDef);
    return body;
  }

  static final _tireFixerWorkbenchPaint = Paint()..color = Colors.cyan;
}
