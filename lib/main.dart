import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/overdrive_components.dart';

void main() {
  runApp(GameWidget(game: OverdriveGame()));
}

class OverdriveGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.viewport = FixedResolutionViewport(Vector2(1280, 720));
    add(GarageEntity());
  }
}
