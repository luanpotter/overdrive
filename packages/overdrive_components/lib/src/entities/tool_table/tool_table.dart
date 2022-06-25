import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flame_behaviors/flame_behaviors.dart';

class ToolTable extends Entity {
  static final _white = BasicPalette.white.paint();
  static final _black = BasicPalette.black.paint();

  ToolTable({required Vector2 position})
      : super(
          position: position,
          size: Vector2.all(24.0),
          anchor: Anchor.center,
        );

  @override
  void render(Canvas canvas) {
    final rect = size.toRect();
    canvas.drawRect(rect, _black);
    canvas.drawRect(rect.deflate(2.0), _white);
    canvas.drawRect(rect.deflate(4.0), _black);
  }
}
