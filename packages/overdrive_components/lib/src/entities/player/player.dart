import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flutter/services.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:overdrive_components/src/entities/player/behaviors/behaviors.dart';
import 'package:overdrive_components/src/entities/player/player_body_component.dart';

export 'character_type.dart';

class Player extends Entity with HasGameRef {
  static final playerSize = PlayerBodyComponent.size;
  static final _heldItemOffset = Vector2(2, 2);
  final CharacterType character;

  ItemType? _holdingItem;

  ItemType? get holdingItem => _holdingItem;

  set holdingItem(ItemType? value) {
    if (_holdingItem != value) {
      _holdingItem = value;

      final current = body.firstChild<ItemEntity>();
      if (current != null) {
        body.remove(current);
      }

      if (value != null) {
        body.add(value.spawn(position: _heldItemOffset, physics: false));
      }
    }
  }

  Player._({
    required Vector2 position,
    required Iterable<Behavior> behaviors,
    required this.character,
  }) : super(
          children: [
            PlayerBodyComponent(position, character),
          ],
          behaviors: behaviors.toList() +
              [ItemPickerBehavior(), TireScrewerBehavior()],
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
    required CharacterType character,
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
          character: character,
        );

  Player.wasd({
    required Vector2 position,
    required CharacterType character,
  }) : this._withKeys(
          position: position,
          leftKey: LogicalKeyboardKey.keyA,
          upKey: LogicalKeyboardKey.keyW,
          rightKey: LogicalKeyboardKey.keyD,
          downKey: LogicalKeyboardKey.keyS,
          runKey: LogicalKeyboardKey.keyH,
          useKey: LogicalKeyboardKey.keyT,
          pickKey: LogicalKeyboardKey.keyG,
          character: character,
        );

  Player.arrows({
    required Vector2 position,
    required CharacterType character,
  }) : this._withKeys(
          position: position,
          leftKey: LogicalKeyboardKey.arrowLeft,
          upKey: LogicalKeyboardKey.arrowUp,
          rightKey: LogicalKeyboardKey.arrowRight,
          downKey: LogicalKeyboardKey.arrowDown,
          runKey: LogicalKeyboardKey.keyK,
          useKey: LogicalKeyboardKey.semicolon,
          pickKey: LogicalKeyboardKey.keyL,
          character: character,
        );

  PlayerBodyComponent get body => firstChild<PlayerBodyComponent>()!;
}
