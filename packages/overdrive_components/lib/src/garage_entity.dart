import 'dart:ui';

import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class GarageEntity extends Entity {
  static final _paint = BasicPalette.white.paint();

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect().deflate(32.0), _paint);
  }
}
