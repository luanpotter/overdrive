import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/src/utils.dart';

import 'tool_table.dart';

class ToolTableBodyComponent extends BodyComponent with ParentIsA<ToolTable> {
  // original size:, 381 x 654,
  static final size = Vector2(3.81, 6.54);

  late final Sprite sprite;
  final Vector2 startPosition;

  ToolTableBodyComponent(this.startPosition);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load(Assets.images.toolbox.keyName);
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

    final shape = size.toRect().toPolygonShape();
    final fixtureDef = FixtureDef(shape)..restitution = 1.0;
    body.createFixture(fixtureDef);
    return body;
  }
}
