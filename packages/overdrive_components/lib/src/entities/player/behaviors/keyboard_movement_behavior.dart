import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Pair;
import 'package:flutter/services.dart';
import 'package:overdrive_components/src/entities/entities.dart';
import 'package:overdrive_components/src/entities/player/behaviors/behaviors.dart';

const interactDistance = 12;

typedef MapCallback<T> = double Function(Body player, T item);
typedef WhereCallback<T> = bool Function(T item);

class KeyboardMovementBehavior extends Behavior<Player>
    with KeyboardHandler, HasGameRef {
  Body get player => parent.body.body;

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

  final _movement = Vector2.zero();

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
      _runFactor = 4;
    } else {
      _runFactor = 1;
    }

    final tireRemover = parent.findBehavior<TireScrewerBehavior>();
    if (keysPressed.contains(useKey)) {
      if (parent.holdingItem == ItemType.screwdriver) {
        tireRemover.start();
      }
    } else {
      tireRemover.stop();
    }

    if (keysPressed.contains(pickKey)) {
      parent.findBehavior<ItemPickerBehavior>().start();
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    final acc = _movement * (baseImpulse * _runFactor * dt);
    player.applyLinearImpulse(acc);

    super.update(dt);
  }
}
