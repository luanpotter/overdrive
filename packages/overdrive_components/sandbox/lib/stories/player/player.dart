import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:sandbox/common/common.dart';
import 'package:overdrive_components/overdrive_components.dart';

void addPlayerStories(Dashbook dashbook) {
  dashbook
      .storiesOf('Player')
      .add('AWSD', (_) => GameWidget(game: StoryGame(Player.awsd())))
      .add('Arrows', (_) => GameWidget(game: StoryGame(Player.arrows())));
}
