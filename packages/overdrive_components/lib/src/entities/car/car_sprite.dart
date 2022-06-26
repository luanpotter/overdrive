import 'dart:math';

import 'package:flame/components.dart';
import 'package:overdrive_components/gen/assets.gen.dart';

final _carColors = <String>[
  Assets.images.car.carFrontBlue.keyName,
  Assets.images.car.carFrontGreen.keyName,
  Assets.images.car.carFrontRed.keyName,
  Assets.images.car.carFrontYellow.keyName,
  Assets.images.car.carFrontCyan.keyName,
];

class CarSprite extends SpriteComponent {
  static Vector2 get spriteSize => Vector2(6.25, 2.77) * 3;

  static Vector2 get frontTirePosition => Vector2(7.3, 3.8);

  static Vector2 get backTirePosition => Vector2(2.5, 3.8);

  factory CarSprite.anyColor() {
    final random = Random();

    final index = random.nextInt(_carColors.length);
    return CarSprite._(_carColors[index]);
  }

  CarSprite.color(int colorIndex) : this._(_carColors[colorIndex]);

  CarSprite._(this.spriteAsset);

  final String spriteAsset;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = spriteSize;
    sprite = await Sprite.load(spriteAsset);
  }
}

class CarSpriteBackground extends SpriteComponent {
  static Vector2 get spriteSize => CarSprite.spriteSize;

  CarSpriteBackground();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = spriteSize;
    sprite = await Sprite.load(Assets.images.car.carBack.keyName);
  }
}
