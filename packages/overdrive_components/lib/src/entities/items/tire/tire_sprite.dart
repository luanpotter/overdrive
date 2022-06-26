import 'dart:ui';

import 'package:flame/components.dart';

import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/overdrive_components.dart';

class TireSprite extends SpriteComponent with ParentIsA<Tire> {
  static Vector2 get spriteSize => Vector2(4.32, 4.49) * 0.9;

  TireSprite.repaired(Vector2? position)
      : this._(Assets.images.car.tyre.keyName, position);

  TireSprite.damaged(Vector2? position)
      : this._(Assets.images.car.tyreDamaged.keyName, position);

  TireSprite._(this.spriteAsset, Vector2? position) : super(position: position);

  final String spriteAsset;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = spriteSize;
    sprite = await Sprite.load(spriteAsset);
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
