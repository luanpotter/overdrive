import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/utils.dart';

class PneumaticScrewdriverBodyComponent extends BodyComponent
    with ParentIsA<PneumaticScrewdriver> {
  static final size = Vector2(4.21, 2.39);

  final Vector2 startPosition;

  PneumaticScrewdriverBodyComponent({
    required this.startPosition,
  });

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
}
