import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/src/utils.dart';

import 'player.dart';

class PlayerBodyComponent extends BodyComponent with ParentIsA<Player> {
  // original sprite size: 468 x 613
  static final Vector2 size = Vector2(4.68, 6.13);

  late final Sprite sprite;
  final Vector2 startPosition;

  PlayerBodyComponent(this.startPosition);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load('player.png');
  }

  @override
  void render(Canvas canvas) {
    sprite.render(canvas, size: size);
  }

  @override
  Body createBody() {
    final def = BodyDef()
      ..type = BodyType.dynamic
      ..fixedRotation = true
      ..position = startPosition;
    final body = world.createBody(def)
      ..userData = this
      ..linearDamping = 2.0;

    final shape = size.toRect().toPolygonShape();
    final fixtureDef = FixtureDef(shape)
      ..density = 0.0002
      ..restitution = 0.5;
    body.createFixture(fixtureDef);
    return body;
  }
}
