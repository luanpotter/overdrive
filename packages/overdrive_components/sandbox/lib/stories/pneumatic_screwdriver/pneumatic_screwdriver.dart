import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addPneumaticScrewdiver(Dashbook dashbook) {
  dashbook.storiesOf('Pneumatic Screwdriver').add(
        'Simple',
        (_) => GameWidget(
          game: StoryGame(
            PneumaticScrewdriver(
              position: Vector2.zero(),
              physics: true,
            ),
          ),
        ),
      );
}
