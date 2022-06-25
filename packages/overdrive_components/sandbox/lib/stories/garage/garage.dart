import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addGarageStories(Dashbook dashbook) {
  dashbook
      .storiesOf('Garage')
      .add('simple', (_) => GameWidget(game: StoryGame(Garage())));
}
