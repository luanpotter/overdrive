import 'package:flame/game.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:overdrive_components/overdrive_components.dart';

abstract class ItemEntity extends Entity {
  ItemEntity({
    super.children,
  });

  Vector2? get realPosition;
  ItemType get itemType;
}

enum ItemType {
  screwdriver,
  demageTire,
  normalTire,
}

extension ItemTypeMethods on ItemType {
  Entity spawn({
    required Vector2 position,
    required bool physics,
  }) {
    switch (this) {
      case ItemType.screwdriver:
        return PneumaticScrewdriver(position: position, physics: physics);
      case ItemType.demageTire:
        return Tire.damaged(
          position: position,
          physics: physics,
        );
      case ItemType.normalTire:
        return Tire.normal(
          position: position,
          physics: physics,
        );
    }
  }
}
