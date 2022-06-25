import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/services.dart';
import 'package:overdrive_components/src/entities/entities.dart';

class KeyboardMovementBehavior extends Behavior<Player>
    with KeyboardHandler, HasGameRef {
  KeyboardMovementBehavior({
    required this.upKey,
    required this.downKey,
    required this.leftKey,
    required this.rightKey,
    this.speed = 100,
  });

  /// The left key.
  final LogicalKeyboardKey leftKey;

  /// The up key.
  final LogicalKeyboardKey upKey;

  /// The right key.
  final LogicalKeyboardKey rightKey;

  /// The down key.
  final LogicalKeyboardKey downKey;

  /// The speed at which the player moves.
  final double speed;

  int _movementX = 0;

  int _movementY = 0;

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.containsAll([upKey, leftKey])) {
      _movementY = -1;
      _movementX = -1;
    } else if (keysPressed.containsAll([upKey, rightKey])) {
      _movementY = -1;
      _movementX = 1;
    } else if (keysPressed.containsAll([downKey, leftKey])) {
      _movementY = 1;
      _movementX = -1;
    } else if (keysPressed.containsAll([downKey, rightKey])) {
      _movementY = 1;
      _movementX = 1;
    } else if (keysPressed.contains(leftKey)) {
      _movementX = -1;
      _movementY = 0;
    } else if (keysPressed.contains(upKey)) {
      _movementY = -1;
      _movementX = 0;
    } else if (keysPressed.contains(rightKey)) {
      _movementX = 1;
      _movementY = 0;
    } else if (keysPressed.contains(downKey)) {
      _movementY = 1;
      _movementX = 0;
    } else {
      _movementX = 0;
      _movementY = 0;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    parent.position.y += _movementY * speed * dt;
    parent.position.x += _movementX * speed * dt;

    super.update(dt);
  }
}