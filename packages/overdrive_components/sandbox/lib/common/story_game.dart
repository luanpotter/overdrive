import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class StoryGame extends Forge2DGame with HasKeyboardHandlerComponents {
  StoryGame(
    this.component, {
    this.center = true,
  }) {
    // Clearing the prefix allows us to load images from packages.
    images.prefix = '';
    Flame.images.prefix = '';
  }

  final PositionComponent component;
  final bool center;

  @override
  Color backgroundColor() => Color(0xFFFFFFFF);

  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(Vector2(1280, 720));
    if (center) {
      camera.followVector2(Vector2.zero());
    }
    await add(component);
  }
}
