import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addCarSpriteStories(Dashbook dashbook) {
  dashbook.storiesOf('CarSprite').add(
    'Any color',
    (context) {
      final carSprite = CarSpriteComposite(
        childrenInBetween: [
          TireSprite.repaired(CarSpriteComposite.frontTirePosition),
          TireSprite.damaged(CarSpriteComposite.backTirePosition),
        ],
        carSprite: CarSprite.anyColor(),
      );

      return GameWidget(
        game: StoryGame(
          center: true,
          carSprite,
        ),
      );
    },
  );
}
