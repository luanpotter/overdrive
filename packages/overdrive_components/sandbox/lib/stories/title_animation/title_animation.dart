import 'package:dashbook/dashbook.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/overdrive_components.dart';

class _Game extends FlameGame {
  _Game() : super(children: [TitleAnimation()]) {
    images.prefix = '';
  }

  @override
  Color backgroundColor() {
    return Colors.transparent;
  }
}

void addTitleAnimation(Dashbook dashbook) {
  dashbook.storiesOf('Title animation').add('animation', (context) {
    return Center(
      child: ClipRect(
        child: SizedBox(
          width: 600,
          height: 400,
          child: GameWidget(
            game: _Game(),
          ),
        ),
      ),
    );
  });
}
