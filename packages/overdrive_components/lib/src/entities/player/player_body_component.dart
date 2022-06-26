import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:overdrive_components/gen/assets.gen.dart';
import 'package:overdrive_components/src/entities/player/player.dart';
import 'package:overdrive_components/src/utils.dart';

class PlayerBodyComponent extends BodyComponent with ParentIsA<Player> {
  // original sprite size: 468 x 613
  static final Vector2 size = Vector2(4.68, 6.13);

  late final Sprite sprite;
  final Vector2 startPosition;
  final CharacterType character;

  PlayerBodyComponent(
    this.startPosition,
    this.character,
  );

  Map<CharacterType, String> get characterTypes => {
        CharacterType.female_1: Assets.images.characters.female1.keyName,
        CharacterType.female_2: Assets.images.characters.female2.keyName,
        CharacterType.female_3: Assets.images.characters.female3.keyName,
        CharacterType.male_1: Assets.images.characters.male1.keyName,
        CharacterType.male_2: Assets.images.characters.male2.keyName,
        CharacterType.male_3: Assets.images.characters.male3.keyName,
      };

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load(characterTypes[character]!);
    paint = Paint()..filterQuality = FilterQuality.medium..isAntiAlias = false;
  }

  @override
  void render(Canvas canvas) {
    sprite.render(canvas, size: size, overridePaint: paint);
  }

  @override
  Body createBody() {
    final def = BodyDef()
      ..type = BodyType.dynamic
      ..fixedRotation = true
      ..position = startPosition;
    final body = world.createBody(def)
      ..userData = this
      ..linearDamping = 2.0;

    final shape = size.toRect().toPolygonShape();
    final fixtureDef = FixtureDef(shape)
      ..density = 0.0002
      ..restitution = 0.5;
    body.createFixture(fixtureDef);
    return body;
  }
}
