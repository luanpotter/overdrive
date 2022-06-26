import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/src/utils.dart';

class TireFixerWorkbenchBodyComponent extends BodyComponent
    with ParentIsA<TireFixerWorkbench> {
  static final size = Vector2(11.64, 7.43);

  late final Sprite sprite;
  final Vector2 startPosition;

  TireFixerWorkbenchBodyComponent({
    required this.startPosition,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load(Assets.images.tireFixerWorkbench.keyName);
  }

  @override
  void render(Canvas canvas) {
    sprite.render(canvas, size: size);
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
}
