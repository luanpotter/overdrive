import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/material.dart';

class Player extends Entity with HasGameRef {
  Player()
      : super(
          size: _playerSize,
          children: [
            RectangleComponent.relative(_playerSize, parentSize: _playerSize)
              ..paint = _paintPaint
          ],
        );

  static final _playerSize = Vector2(10, 10);
  static final _paintPaint = Paint()..color = Colors.red;
}
