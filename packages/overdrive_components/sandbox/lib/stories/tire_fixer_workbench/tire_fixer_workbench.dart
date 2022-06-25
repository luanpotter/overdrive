import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:sandbox/common/common.dart';

void addTireFixerWorkbench(Dashbook dashbook) {
  dashbook.storiesOf('Tire fixer workbench').add(
        'simple',
        (_) => GameWidget(
          game: StoryGame(
            TireFixerWorkbench(
              position: Vector2.zero(),
            ),
          ),
        ),
      );
}
