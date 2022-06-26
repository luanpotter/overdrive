import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:overdrive_components/overdrive_components.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 320,
              width: 500,
              decoration: BoxDecoration(
                color: const Color(0xffC2D0E8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
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
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/credits'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
