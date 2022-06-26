import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/overdrive_components.dart';

class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 320,
          width: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF4A86E8), width: 10),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRect(
              child: GameWidget(
                game: TitleAnimationPlayer(),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: const Text('Play'),
                onPressed: () => Navigator.of(context).pushNamed('/stages'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                child: const Text('Settings'),
                onPressed: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                child: const Text('Credits'),
                onPressed: () => Navigator.of(context).pushNamed('/credits'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
