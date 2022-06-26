import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Credits',
            style: TextStyle(fontSize: 30),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 800,
                child: Column(
                  children: [
                    const Text('Built with love by:'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Elias Reis'),
                    const Text('Erick Zanardo'),
                    const Text('Felix Angelov'),
                    const Text('Luan Nico'),
                    const Text('Renan Araujo'),
                    const Text('Tyemy Kuga'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('For the BIG Game Jam!'),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      child: const Text('Back'),
                      onPressed: () => Navigator.of(context).pushNamed('/'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
