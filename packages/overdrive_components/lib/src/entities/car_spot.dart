import 'package:flame/components.dart';
import 'package:overdrive_components/gen/assets.gen.dart';

class CarSpot extends SpriteComponent with HasGameRef {
  CarSpot({ required this.top });

  final bool top;

  @override
  Future<void> onLoad() async {
    height = gameRef.size.y / 5;
    width = 32.0;
    x = (gameRef.size.x - width) / 2;
    if (top) {
    y = height;
    } else {
      y = 3 * height;
    }

    sprite = await Sprite.load(Assets.images.carSpot.keyName);
  }
}
