import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import 'tool_table.dart';

class ToolTableBodyComponent extends BodyComponent with ParentIsA<ToolTable> {
  static final _black = BasicPalette.black.paint();
  static final _white = BasicPalette.white.paint();
  static final size = 4.0;

  final Vector2 startPosition;

  ToolTableBodyComponent(this.startPosition);

  @override
  void render(Canvas canvas) {
    final rect = Vector2.all(size).toRect();
    canvas.drawRect(rect, _black);
    canvas.drawRect(rect.deflate(0.2), _white);
    canvas.drawRect(rect.deflate(0.4), _black);
  }

  @override
  Body createBody() {
    final def = BodyDef()
      ..type = BodyType.kinematic
      ..position = startPosition;
    final body = world.createBody(def)..userData = this;

    final vertices = [
      Vector2(0, 0),
      Vector2(0, size),
      Vector2(size, size),
      Vector2(size, 0),
    ];
    final shape = PolygonShape()..set(vertices);
    final fixtureDef = FixtureDef(shape)..restitution = 1.0;
    body.createFixture(fixtureDef);
    return body;
  }
}
