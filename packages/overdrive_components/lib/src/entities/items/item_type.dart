import 'package:flame/game.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';

abstract class ItemEntity extends Entity {
  ItemEntity({
    super.children,
  });

  Vector2 get realPosition;
  ItemType get itemType;
}

enum ItemType { screwdriver }

extension ItemTypeMethods on ItemType {
  Entity spawn(Vector2 position) {
    switch (this) {
      case ItemType.screwdriver:
        return PneumaticScrewdriver(position: position);
    }
  }
}
