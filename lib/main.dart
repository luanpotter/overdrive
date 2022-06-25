import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/overdrive_components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

void main() {
  runApp(GameWidget(game: OverdriveGame()));
}

class OverdriveGame extends Forge2DGame with HasKeyboardHandlerComponents {
  OverdriveGame()
      : super(
          gravity: Vector2.zero(),
          camera: createCamera(),
          zoom: 1,
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
      Player.wasd(position: size / 2 - Vector2(100, Player.playerSize.y / 2)),
    );
    add(ToolTable(position: (size - ToolTable.toolTableSize) / 2));
    add(TireFixerWorkbench(position: size / 2 + Vector2(100, -270)));
    add(TireFixerWorkbench(position: size / 2 - Vector2(160, -240)));
  }
}
