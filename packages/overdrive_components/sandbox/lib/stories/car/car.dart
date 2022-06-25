import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addCarStories(Dashbook dashbook) {
  dashbook
      .storiesOf('Car')
      .add(
        'Drive In',
        (context) => GameWidget(
          game: StoryGame(
            center: false,
            Car(
              position: Vector2(1280, 720 / 2),
              behaviors: [
                DriveInBehavior(),
              ],
            ),
          ),
        ),
      )
      .add(
        'Drive Out',
        (context) => GameWidget(
          game: StoryGame(
            center: false,
            Car(
              position: Vector2(1280 / 2, 720 / 2),
              behaviors: [
                DriveOutBehavior(),
              ],
            ),
          ),
        ),
      );
}
