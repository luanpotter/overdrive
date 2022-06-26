import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addPlayerStories(Dashbook dashbook) {
  dashbook
      .storiesOf('Player')
      .add(
        'WASD',
        (_) => GameWidget(
          game: StoryGame(
            Player.wasd(
              position: Vector2.zero(),
              character: CharacterType.female_1,
            ),
          ),
        ),
      )
      .add(
        'Arrows',
        (_) => GameWidget(
          game: StoryGame(
            Player.arrows(
              position: Vector2.zero(),
              character: CharacterType.female_1,
            ),
          ),
        ),
      );
}
