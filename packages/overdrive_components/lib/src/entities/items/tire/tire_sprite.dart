import 'package:flame/components.dart';

import '../../../../gen/assets.gen.dart';

class TireSprite extends SpriteComponent {
  static Vector2 get spriteSize => Vector2(4.32, 4.49) * 0.7;

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
  }
}
