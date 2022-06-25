import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addCarStories(Dashbook dashbook) {
  dashbook
      .storiesOf('Car')
      .add('simple', (context) => GameWidget(game: StoryGame(Car())));
}
