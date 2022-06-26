import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';

import 'garage_border_body.dart';

class Garage extends Entity with HasGameRef {
  static final _paint = BasicPalette.white.paint();
  static final _carSpotPaint = Paint()..color = const Color(0xFFCCCCCC);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final delta = Vector2.all(4);
    final size = gameRef.size - (delta * 2);
    await add(
      GarageBorderBody(
        position: delta,
        size: size,
      ),
    );

    add(GarageFloor(position: delta, size: size));
  }

  @override
  void renderTree(Canvas canvas) {
    super.renderTree(canvas);
    renderCarSpots(canvas);
  }

  void renderBackground(Canvas canvas) {
    canvas.drawRect(gameRef.size.toRect().deflate(4.0), _paint);
  }

  void renderCarSpots(Canvas canvas) {
    final height = gameRef.size.y / 5;
    final width = 32.0;
    final x = (gameRef.size.x - width) / 2;
    canvas.drawRect(Rect.fromLTWH(x, height, width, height), _carSpotPaint);
    canvas.drawRect(Rect.fromLTWH(x, 3 * height, width, height), _carSpotPaint);
  }
}
