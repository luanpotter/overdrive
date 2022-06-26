import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:overdrive_components/gen/assets.gen.dart';

class _RunningChar extends PositionComponent with ParentIsA<TitleAnimation> {
  _RunningChar({required this.runningAway});

  final bool runningAway;

  @override
  Future<void> onLoad() async {
    final char = SpriteComponent(
      sprite: parent._charSprite,
      size: Vector2(
        (parent._charSprite.image.width / parent._scale).roundToDouble(),
        (parent._charSprite.image.height / parent._scale).roundToDouble(),
      ),
    );

    final wheel = SpriteComponent(
      sprite: parent._wheelSprite,
      size: Vector2(
        (parent._wheelSprite.image.width / parent._scale).roundToDouble(),
        (parent._wheelSprite.image.height / parent._scale).roundToDouble(),
      ),
    );

    const gap = 50;
    double charX = 0;
    if (runningAway) {
      wheel.flipHorizontally();
      char.flipHorizontally();
      charX = -wheel.width - gap;
    } else {
      wheel.x = char.width + gap;
    }

    char.x = charX;
    char.add(
      SequenceEffect([
        MoveEffect.to(Vector2(charX, 10), LinearEffectController(.2)),
        MoveEffect.to(Vector2(charX, 0), LinearEffectController(.2)),
      ], infinite: true),
    );

    position = runningAway
        ? Vector2(
            parent.gameRef.size.x * 2,
            parent._titleComponent.y + parent._titleComponent.height,
          )
        : Vector2(-parent.gameRef.size.x, parent._titleComponent.height);

    final destination = runningAway
        ? Vector2(
            -parent.gameRef.size.x,
            parent._titleComponent.y + parent._titleComponent.height,
          )
        : Vector2(parent.gameRef.size.x, parent._titleComponent.height);

    final effect = MoveEffect.to(destination, LinearEffectController(2))
      ..onComplete = () {
        Future<void>.delayed(Duration(seconds: 2)).then((_) {
          removeFromParent();
          parent.add(_RunningChar(runningAway: !runningAway));
        });
        ;
      };

    addAll([char, wheel, effect]);
  }
}

class TitleAnimation extends PositionComponent with HasGameRef {
  late final Sprite _titleSprite;
  late final Sprite _charSprite;
  late final Sprite _wheelSprite;
  late final double _scale;

  late final SpriteComponent _titleComponent;

  @override
  Future<void> onLoad() async {
    _titleSprite = await gameRef.loadSprite(
      Assets.images.titleScreen.title.keyName,
    );
    _charSprite = await gameRef.loadSprite(
      Assets.images.titleScreen.scaredChar.keyName,
    );
    _wheelSprite = await gameRef.loadSprite(
      Assets.images.titleScreen.wheel.keyName,
    );

    _scale = _titleSprite.image.width / gameRef.size.x;

    addAll(
      [
        _titleComponent = SpriteComponent(
          sprite: _titleSprite,
          anchor: Anchor.center,
          size: Vector2(
            (_titleSprite.image.width / _scale).roundToDouble(),
            (_titleSprite.image.height / _scale).roundToDouble(),
          ),
          position: gameRef.size / 2,
        ),
        _RunningChar(runningAway: false),
      ],
    );
  }
}
