import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:overdrive/pages/stage_selection.dart';
import 'package:overdrive/pages/title_screen.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

void main() {
  Flame.images.prefix = '';

  runApp(
    MaterialApp(
      routes: {
        '/': (context) => TitleScreen(),
        '/stages': (context) => StageSelection(),
        '/game': (context) => GameWidget(game: OverdriveGame()),
      },
    ),
  );
}

class OverdriveGame extends Forge2DGame with HasKeyboardHandlerComponents {
  OverdriveGame()
      : super(
          gravity: Vector2.zero(),
          camera: createCamera(),
        );

  static Camera createCamera() {
    final camera = Camera();
    camera.viewport = FixedResolutionViewport(Vector2(1280, 720));
    return camera;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(Garage());
    add(
      Player.wasd(position: size / 2 - Vector2(10, Player.playerSize.y / 2)),
    );
    add(ToolTable(position: (size - ToolTable.toolTableSize) / 2));
    add(
      TireFixerWorkbench(
        position: Vector2(
          8.0,
          size.y - TireFixerWorkbench.tireFixerWorkbenchSize.y - 8.0,
        ),
      ),
    );
    add(
      TireFixerWorkbench(
        position: Vector2(
          size.x - TireFixerWorkbench.tireFixerWorkbenchSize.x - 8.0,
          8.0,
        ),
      ),
    );
    add(
      PneumaticScrewdriver(
        position: size / 2 + Vector2(-5, -27),
        physics: true,
      ),
    );

    spawnCar();
  }

  void spawnCar() {
    add(Car.damaged(lane: 0, behaviors: [DriveInBehavior()]));
  }
}
