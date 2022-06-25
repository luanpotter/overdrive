import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class Garage extends Entity with HasGameRef {
  static final _paint = BasicPalette.white.paint();

  @override
  void render(Canvas canvas) {
    canvas.drawRect(gameRef.size.toRect().deflate(32.0), _paint);
  }
}