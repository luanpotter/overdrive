import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: OverdriveGame()));
}

class OverdriveGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // TODO: load stuff
  }
}
