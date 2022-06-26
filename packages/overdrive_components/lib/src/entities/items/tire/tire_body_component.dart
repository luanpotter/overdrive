import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/src/entities/entities.dart';

class TireBodyComponent extends BodyComponent with ParentIsA<Tire> {
  final Vector2 startPosition;

  TireBodyComponent({
    required this.startPosition,
  });

  @override
  Body createBody() {
    renderBody = false;
    final def = BodyDef()
      ..type = BodyType.dynamic
      ..position = startPosition;
    final body = world.createBody(def)..userData = this;

    final fixtureDef = FixtureDef(
      CircleShape()..radius = Tire.tireRadius,
    )..restitution = 1.0;
    body.createFixture(fixtureDef);
    return body;
  }
}
