import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class Garage extends Entity with HasGameRef {
  static final _paint = BasicPalette.white.paint();
  static final _carSpotPaint = BasicPalette.red.paint();

  @override
  void render(Canvas canvas) {
    renderBackground(canvas);
    renderCarSpots(canvas);
  }

  void renderBackground(Canvas canvas) {
    canvas.drawRect(gameRef.size.toRect().deflate(32.0), _paint);
  }

  void renderCarSpots(Canvas canvas) {
    final height = gameRef.size.y / 5;
    final width = 320.0;
    final x = (gameRef.size.x - width) / 2;
    canvas.drawRect(Rect.fromLTWH(x, height, width, height), _carSpotPaint);
    canvas.drawRect(Rect.fromLTWH(x, 3 * height, width, height), _carSpotPaint);
  }
}
