import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/src/utils.dart';

import 'garage.dart';

class GarageBorderBody extends BodyComponent with ParentIsA<Garage> {
  final Vector2 position;
  final Vector2 size;

  GarageBorderBody({
    required this.position,
    required this.size,
  });

  @override
  Body createBody() {
    final def = BodyDef()
      ..type = BodyType.static
      ..position = position;
    final body = world.createBody(def)..userData = this;

    final vertices = [
      Vector2(0, 0),
      Vector2(0, size.y),
      size,
      Vector2(size.x, 0),
    ];
    vertices
        .zipWithNext((v1, v2) => EdgeShape()..set(v1, v2), loopAround: true)
        .map((edge) => FixtureDef(edge)..restitution = 1.0)
        .forEach(body.createFixture);
    return body;
  }
}
