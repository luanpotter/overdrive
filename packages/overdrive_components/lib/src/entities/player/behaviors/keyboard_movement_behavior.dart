import 'package:dartlin/dartlin.dart';
import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Pair;
import 'package:flutter/services.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/entities/items/item_type.dart';
import 'package:overdrive_components/src/utils.dart';

const _MAX_PICKUP_DISTANCE = 7.5;

class KeyboardMovementBehavior extends Behavior<Player>
    with KeyboardHandler, HasGameRef {
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
      // TODO(elias): use the object;
    }

    if (keysPressed.contains(pickKey)) {
      final player = parent.body.body;
      final currentHoldingItem = parent.holdingItem;
      if (currentHoldingItem != null) {
        final entity = currentHoldingItem.spawn(
          position: player.position + Vector2(2.0, 0),
          physics: true,
        );
        parent.gameRef.add(entity);
        parent.holdingItem = null;
      } else {
        final closestItem = parent.gameRef.children
            .whereType<ItemEntity>()
            .where((item) => item.realPosition != null)
            .map((item) => Pair(item, _computePickupDistance(player, item)))
            .minOrNullBy((pair) => pair.value);
        if (closestItem != null && closestItem.value <= _MAX_PICKUP_DISTANCE) {
          parent.holdingItem = closestItem.key.itemType;
          parent.gameRef.remove(closestItem.key);
        }
      }
    }
    return super.onKeyEvent(event, keysPressed);
  }

  static double _computePickupDistance(Body player, ItemEntity item) {
    return item.realPosition!.distanceTo(player.position);
  }

  @override
  void update(double dt) {
    final acc = _movement * (baseImpulse * _runFactor * dt);
    parent.body.body.applyLinearImpulse(acc);

    super.update(dt);
  }
}
