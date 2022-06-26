import 'package:flame/components.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'dart:math';

final _carColors = <String>[
  Assets.images.car.carFrontBlue.keyName,
  Assets.images.car.carFrontGreen.keyName,
  Assets.images.car.carFrontRed.keyName,
  Assets.images.car.carFrontYellow.keyName,
  Assets.images.car.carFrontCyan.keyName,
];

class CarSpriteComposite extends PositionComponent {
  static Vector2 get spriteSize => Vector2(6.25, 2.77) * 3;

  final List<Component> childrenInBetween;
  final CarSprite carSprite;

  CarSpriteComposite({
    required this.childrenInBetween,
    required this.carSprite,
    Vector2? position,
  }) : super(position: position);

  Future<void> onLoad() async {
    await add(CarSpriteBackground());
    // tires go here
    await addAll(childrenInBetween);
    await add(carSprite);
  }
}

class CarSprite extends SpriteComponent {
  static Vector2 get spriteSize => CarSpriteComposite.spriteSize;

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
  static Vector2 get spriteSize => CarSpriteComposite.spriteSize;

  CarSpriteBackground();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = spriteSize;
    sprite = await Sprite.load(Assets.images.car.carBack.keyName);
  }
}
