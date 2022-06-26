import 'dart:ui';

import 'package:flame/components.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/src/entities/entities.dart';

class PneumaticScrewdriverSprite extends SpriteComponent
    with ParentIsA<PneumaticScrewdriver> {
  static final spriteSize = Vector2(4.21, 2.39);

  PneumaticScrewdriverSprite({required super.position});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = spriteSize;
    sprite = await Sprite.load(Assets.images.screwDriverTool.keyName);
    paint = Paint()..filterQuality = FilterQuality.medium..isAntiAlias = false;
  }

  @override
  void update(double dt) {
    final body = parent.body;
    if (body == null) {
      return;
    }

    position = body.body.position;
  }
}
