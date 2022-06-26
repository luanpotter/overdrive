import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/utils.dart';

class PneumaticScrewdriverBodyComponent extends BodyComponent with ParentIsA<PneumaticScrewdriver>{
  static final size = Vector2(4.21, 2.39);

  late final Sprite sprite;
  final Vector2 startPosition;

  PneumaticScrewdriverBodyComponent({
    required this.startPosition
  });
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load(Assets.images.screwDriverTool.keyName);
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
