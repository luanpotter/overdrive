import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'behaviors/behaviors.dart';

class Player extends Entity with HasGameRef {
  Player._({
    required Iterable<Behavior> behaviors,
  }) : super(
          size: _playerSize,
          children: [
            RectangleComponent.relative(_playerSize, parentSize: _playerSize)
              ..paint = _paintPaint
          ],
          behaviors: behaviors,
        );

  Player._withKeys({
    required LogicalKeyboardKey leftKey,
    required LogicalKeyboardKey upKey,
    required LogicalKeyboardKey rightKey,
    required LogicalKeyboardKey downKey,
    required LogicalKeyboardKey pickKey,
    required LogicalKeyboardKey runKey,
    required LogicalKeyboardKey useKey,
  }) : this._(
          behaviors: [
            KeyboardMovementBehavior(
              upKey: upKey,
              downKey: downKey,
              leftKey: leftKey,
              rightKey: rightKey,
              pickKey: pickKey,
              runKey: runKey,
              useKey: useKey,
            ),
          ],
        );

  Player.awsd()
      : this._withKeys(
          leftKey: LogicalKeyboardKey.keyA,
          upKey: LogicalKeyboardKey.keyW,
          rightKey: LogicalKeyboardKey.keyD,
          downKey: LogicalKeyboardKey.keyS,
          runKey: LogicalKeyboardKey.keyH,
          useKey: LogicalKeyboardKey.keyT,
          pickKey: LogicalKeyboardKey.keyG,
        );

  Player.arrows()
      : this._withKeys(
          leftKey: LogicalKeyboardKey.arrowLeft,
          upKey: LogicalKeyboardKey.arrowUp,
          rightKey: LogicalKeyboardKey.arrowRight,
          downKey: LogicalKeyboardKey.arrowDown,
          runKey: LogicalKeyboardKey.keyK,
          useKey: LogicalKeyboardKey.semicolon,
          pickKey: LogicalKeyboardKey.keyL,
        );

  static final _playerSize = Vector2(10, 10);
  static final _paintPaint = Paint()..color = Colors.red;
}
