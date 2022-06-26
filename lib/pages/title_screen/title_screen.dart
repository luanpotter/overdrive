import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.red,
          height: 350,
          width: 500,
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
                onPressed: () => Navigator.of(context).pushNamed('/game'),
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
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
