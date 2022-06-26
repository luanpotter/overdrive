import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';

import 'garage_border_body.dart';

class Garage extends Entity with HasGameRef {
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

    add(CarSpot(top: true));
    add(CarSpot(top: false));
  }
}
