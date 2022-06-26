import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addToolTableStories(Dashbook dashbook) {
  dashbook.storiesOf('Tool Table').add(
        'simple',
        (_) => GameWidget(
          game: StoryGame(
            ToolTable(
              startPosition: Vector2.zero(),
            ),
          ),
        ),
      );
}
