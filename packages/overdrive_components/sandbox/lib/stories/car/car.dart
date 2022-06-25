import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addCarStories(Dashbook dashbook) {
  dashbook.storiesOf('Car').add(
    'Drive In',
    (context) {
      final status = context.optionsProperty<CarStatus>(
        'status',
        CarStatus.repaired,
        [
          PropertyOption('repaired', CarStatus.repaired),
          PropertyOption('damaged', CarStatus.damaged),
        ],
      );

      final position = Vector2(1280, 720 / 2);
      final behaviors = [DriveInBehavior()];
      final Car car;

      switch (status) {
        case CarStatus.damaged:
          car = Car.damaged(position: position, behaviors: behaviors);
          break;
        case CarStatus.repaired:
          car = Car.repaired(position: position, behaviors: behaviors);
      }

      return GameWidget(game: StoryGame(center: false, car));
    },
  ).add(
    'Drive Out',
    (context) {
      final status = context.optionsProperty<CarStatus>(
        'status',
        CarStatus.repaired,
        [
          PropertyOption('repaired', CarStatus.repaired),
          PropertyOption('damaged', CarStatus.damaged),
        ],
      );

      final position = Vector2(1280 / 2, 720 / 2);
      final behaviors = [DriveOutBehavior()];
      final Car car;

      switch (status) {
        case CarStatus.damaged:
          car = Car.damaged(position: position, behaviors: behaviors);
          break;
        case CarStatus.repaired:
          car = Car.repaired(position: position, behaviors: behaviors);
      }

      return GameWidget(game: StoryGame(center: false, car));
    },
  );
}
