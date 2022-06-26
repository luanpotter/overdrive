import 'package:flame/components.dart';
import 'package:overdrive_components/gen/assets.gen.dart';

class GarageFloor extends PositionComponent with HasGameRef {
  GarageFloor({
    super.size,
    super.position,
  });

  late final Sprite _floorTile;

  @override
  Future<void> onLoad() async {
    _floorTile = await Sprite.load(Assets.images.floorPattern.keyName);

    const tileSize = 15.0;
    final tileCount = Vector2(
      (size.x / tileSize).ceilToDouble(),
      (size.y / tileSize).ceilToDouble(),
    );

    final yScale = size.y / (tileCount.y * tileSize);

    addAll([
      for (var y = 0; y < tileCount.y; y++)
        for (var x = 0; x < tileCount.x; x++)
          SpriteComponent(
            position: Vector2(x * tileSize, y * tileSize * yScale),
            size: Vector2(
                  tileSize,
                  tileSize * yScale,
                ) +
                Vector2.all(0.1),
            sprite: _floorTile,
          ),
    ]);
  }
}
