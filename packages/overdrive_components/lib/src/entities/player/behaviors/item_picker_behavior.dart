import 'package:dartlin/dartlin.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Pair;
import 'package:overdrive_components/overdrive_components.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/entities/player/behaviors/behaviors.dart';
import 'package:overdrive_components/src/utils.dart';

class ItemPickerBehavior extends Behavior<Player> with HasGameRef {
  double pickCooldown = 0.0;

  void start() {
    if (pickCooldown > 0.0) {
      return;
    }

    final currentHoldingItem = parent.holdingItem;
    if (currentHoldingItem != null) {
      final closestToolTable = findThings<ToolTable>(
        mapCallBack: _computeToolTableDistance,
      );

      if (closestToolTable != null &&
          closestToolTable.value <= minDropDistance) {
        closestToolTable.key.holdingItem = currentHoldingItem;
      } else {
        final entity = currentHoldingItem.spawn(
          position: player.position + Vector2(2.0, 0),
          physics: true,
        );
        parent.gameRef.add(entity);
      }

      pickCooldown = 0.25;
      parent.holdingItem = null;
    } else {
      print(currentHoldingItem);
      final closestItem = findThings<ItemEntity>(
        whereCallback: (item) => item.realPosition != null,
        mapCallBack: _computePickupDistance,
      );

      if (closestItem != null && closestItem.value <= maxPickupDistance) {
        parent.holdingItem = closestItem.key.itemType;
        parent.gameRef.remove(closestItem.key);
        pickCooldown = 0.25;
      }

      final closestToolTable = findThings<ToolTable>(
        mapCallBack: _computeToolTableDistance,
      );

      if (closestToolTable != null &&
          closestToolTable.value <= maxPickupDistance &&
          closestToolTable.key.holdingItem != null) {
        parent.holdingItem = closestToolTable.key.holdingItem;
        closestToolTable.key.holdingItem = null;
        pickCooldown = 0.25;
      }
    }
  }

  Body get player => parent.body.body;
  static double _computePickupDistance(Body player, ItemEntity item) {
    return item.realPosition!.distanceTo(player.position);
  }

  static double _computeToolTableDistance(Body player, ToolTable item) {
    return item.body.body.position.distanceTo(player.position);
  }

  Pair<T, double>? findThings<T>({
    required MapCallback<T> mapCallBack,
    WhereCallback<T>? whereCallback,
  }) =>
      parent.gameRef.children
          .whereType<T>()
          .where(whereCallback ?? (_) => true)
          .map((item) => Pair(item, mapCallBack(player, item)))
          .minOrNullBy<num>((p0) => p0.value);

  @override
  void update(double dt) {
    if (pickCooldown > 0.0) {
      pickCooldown -= dt;
      if (pickCooldown < 0.0) {
        pickCooldown = 0.0;
      }
    }
  }
}
