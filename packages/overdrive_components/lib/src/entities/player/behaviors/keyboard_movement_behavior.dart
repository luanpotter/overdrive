import 'package:dartlin/dartlin.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Pair;
import 'package:flutter/services.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/utils.dart';

const _MAX_PICKUP_DISTANCE = 7.5;
const _MIN_DROP_DISTANCE = 10.5;

typedef double MapCallback<T>(Body player, T item);
typedef bool WhereCallback<T>(T item);

class KeyboardMovementBehavior extends Behavior<Player>
    with KeyboardHandler, HasGameRef {
  double pickCooldown = 0.0;

  KeyboardMovementBehavior({
    required this.upKey,
    required this.downKey,
    required this.leftKey,
    required this.rightKey,
    required this.runKey,
    required this.useKey,
    required this.pickKey,
    this.baseImpulse = 0.2,
  });

  /// The left key.
  final LogicalKeyboardKey leftKey;

  /// The up key.
  final LogicalKeyboardKey upKey;

  /// The right key.
  final LogicalKeyboardKey rightKey;

  /// The down key.
  final LogicalKeyboardKey downKey;

  /// The run key.
  final LogicalKeyboardKey runKey;

  /// The pick key.
  final LogicalKeyboardKey pickKey;

  /// The use key.
  final LogicalKeyboardKey useKey;

  /// The speed at which the player moves.
  double baseImpulse;

  Vector2 _movement = Vector2.zero();

  int _runFactor = 1;

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.containsAll([upKey, leftKey])) {
      _movement.y = -1;
      _movement.x = -1;
    } else if (keysPressed.containsAll([upKey, rightKey])) {
      _movement.y = -1;
      _movement.x = 1;
    } else if (keysPressed.containsAll([downKey, leftKey])) {
      _movement.y = 1;
      _movement.x = -1;
    } else if (keysPressed.containsAll([downKey, rightKey])) {
      _movement.y = 1;
      _movement.x = 1;
    } else if (keysPressed.contains(leftKey)) {
      _movement.x = -1;
      _movement.y = 0;
    } else if (keysPressed.contains(upKey)) {
      _movement.y = -1;
      _movement.x = 0;
    } else if (keysPressed.contains(rightKey)) {
      _movement.x = 1;
      _movement.y = 0;
    } else if (keysPressed.contains(downKey)) {
      _movement.y = 1;
      _movement.x = 0;
    } else {
      _movement.x = 0;
      _movement.y = 0;
    }

    if (keysPressed.contains(runKey)) {
      _runFactor = 2;
    } else {
      _runFactor = 1;
    }

    if (keysPressed.contains(useKey)) {
      if (parent.holdingItem == ItemType.screwdriver) {
        final closestTire = parent.gameRef.children
            .whereType<Car>()
            .expand((car) => car.tires)
            .map((tire) => Pair(tire, _computeDistanceToTire(tire)))
            .minOrNullBy((pair) => pair.value);
        if (closestTire != null && closestTire.value <= _MIN_DROP_DISTANCE) {
          final tire = closestTire.key;
          final car = tire.car;
          if (car != null) {
            // remove tire
            car.body.remove(tire);
            gameRef.add(
              Tire(
                status: tire.status,
                position: parent.body.body.position + Vector2(2.0, 0),
                physics: true,
              ),
            );
          }
        }
      }
    }

    if (keysPressed.contains(pickKey) && pickCooldown == 0.0) {
      final player = parent.body.body;
      final currentHoldingItem = parent.holdingItem;
      if (currentHoldingItem != null) {
        final closestToolTable = findThings<ToolTable>(
          mapCallBack: (player, item) =>
              _computeToolTableDistance(player, item),
          player: player,
        );

        if (closestToolTable != null &&
            closestToolTable.value <= _MIN_DROP_DISTANCE) {
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
        final closestItem = findThings<ItemEntity>(
          whereCallback: (item) => item.realPosition != null,
          mapCallBack: (player, item) => _computePickupDistance(player, item),
          player: player,
        );

        if (closestItem != null && closestItem.value <= _MAX_PICKUP_DISTANCE) {
          parent.holdingItem = closestItem.key.itemType;
          parent.gameRef.remove(closestItem.key);
          pickCooldown = 0.25;
        }

        final closestToolTable = findThings<ToolTable>(
          mapCallBack: (player, item) =>
              _computeToolTableDistance(player, item),
          player: player,
        );

        if (closestToolTable != null &&
            closestToolTable.value <= _MAX_PICKUP_DISTANCE &&
            closestToolTable.key.holdingItem != null) {
          parent.holdingItem = closestToolTable.key.holdingItem;
          closestToolTable.key.holdingItem = null;
          pickCooldown = 0.25;
        }
      }
    }
    return super.onKeyEvent(event, keysPressed);
  }

  double _computeDistanceToTire(Tire tire) {
    final player = parent.body.body;
    final tirePosition =
        tire.position + (tire.car?.body.body.position ?? Vector2.zero());
    return player.position.distanceTo(tirePosition);
  }

  static double _computePickupDistance(Body player, ItemEntity item) {
    return item.realPosition!.distanceTo(player.position);
  }

  static double _computeToolTableDistance(Body player, ToolTable item) {
    return item.body.body.position.distanceTo(player.position);
  }

  Pair<T, double>? findThings<T>({
    required MapCallback mapCallBack,
    required Body player,
    WhereCallback<T>? whereCallback,
  }) =>
      parent.gameRef.children
          .whereType<T>()
          .where(whereCallback ?? (_) => true)
          .map((item) => Pair(item, mapCallBack(player, item)))
          .minOrNullBy((p0) => p0.value);

  @override
  void update(double dt) {
    if (pickCooldown > 0.0) {
      pickCooldown -= dt;
      if (pickCooldown < 0.0) {
        pickCooldown = 0.0;
      }
    }

    final acc = _movement * (baseImpulse * _runFactor * dt);
    parent.body.body.applyLinearImpulse(acc);

    super.update(dt);
  }
}
