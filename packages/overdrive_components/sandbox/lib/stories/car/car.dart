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

      final behaviors = [
        DriveInBehavior(),
      ];
      final Car car;

      switch (status) {
        case CarStatus.damaged:
          car = Car.damaged(lane: 0, behaviors: behaviors);
          break;
        case CarStatus.repaired:
          car = Car.repaired(lane: 0, behaviors: behaviors);
      }

      context.action('Repair', (context) {
        car.tires.forEach((element) => element.repair());
      });

      return GameWidget(game: StoryGame(center: false, car));
    },
  );
}
