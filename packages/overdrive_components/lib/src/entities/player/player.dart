import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/services.dart';

import '../items/item_type.dart';
import 'behaviors/behaviors.dart';
import 'player_body_component.dart';

class Player extends Entity with HasGameRef {
  static final playerSize = PlayerBodyComponent.size;

  ItemType? holdingItem;

  Player._({
    required Vector2 position,
    required Iterable<Behavior> behaviors,
  }) : super(
          children: [
            PlayerBodyComponent(position),
          ],
          behaviors: behaviors,
        );

  Player._withKeys({
    required Vector2 position,
    required LogicalKeyboardKey leftKey,
    required LogicalKeyboardKey upKey,
    required LogicalKeyboardKey rightKey,
    required LogicalKeyboardKey downKey,
    required LogicalKeyboardKey pickKey,
    required LogicalKeyboardKey runKey,
    required LogicalKeyboardKey useKey,
  }) : this._(
          position: position,
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

  Player.wasd({
    required Vector2 position,
  }) : this._withKeys(
          position: position,
          leftKey: LogicalKeyboardKey.keyA,
          upKey: LogicalKeyboardKey.keyW,
          rightKey: LogicalKeyboardKey.keyD,
          downKey: LogicalKeyboardKey.keyS,
          runKey: LogicalKeyboardKey.keyH,
          useKey: LogicalKeyboardKey.keyT,
          pickKey: LogicalKeyboardKey.keyG,
        );

  Player.arrows({
    required Vector2 position,
  }) : this._withKeys(
          position: position,
          leftKey: LogicalKeyboardKey.arrowLeft,
          upKey: LogicalKeyboardKey.arrowUp,
          rightKey: LogicalKeyboardKey.arrowRight,
          downKey: LogicalKeyboardKey.arrowDown,
          runKey: LogicalKeyboardKey.keyK,
          useKey: LogicalKeyboardKey.semicolon,
          pickKey: LogicalKeyboardKey.keyL,
        );

  PlayerBodyComponent get body => firstChild<PlayerBodyComponent>()!;
}
