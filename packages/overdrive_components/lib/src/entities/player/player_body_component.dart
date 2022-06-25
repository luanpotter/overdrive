import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import 'player.dart';

class PlayerBodyComponent extends BodyComponent with ParentIsA<Player> {
  static final double size = 30.0;
  static final _paint = BasicPalette.blue.paint();

  final Vector2 startPosition;

  PlayerBodyComponent(
    this.startPosition,
  ) : super(
          children: [
            RectangleComponent.relative(
              Vector2.all(1),
              parentSize: Vector2.all(size),
              paint: _paint,
            ),
          ],
        );

  @override
  Body createBody() {
    final def = BodyDef()
      ..type = BodyType.dynamic
      ..position = startPosition;
    final body = world.createBody(def)
      ..userData = this
      ..angularDamping = 10.0
      ..linearDamping = 2.0;

    final vertices = [
      Vector2(0, 0),
      Vector2(0, size),
      Vector2(size, size),
      Vector2(size, 0),
    ];
    final shape = PolygonShape()..set(vertices);
    final fixtureDef = FixtureDef(shape)
      ..density = 0.0002
      ..restitution = 0.5;
    body.createFixture(fixtureDef);
    return body;
  }
}
