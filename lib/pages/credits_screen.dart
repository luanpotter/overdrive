import 'package:flutter/material.dart';
import 'package:overdrive/components/header.dart';

class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(
              title: 'Credits',
              backActionButton: () => Navigator.of(context).pushNamed('/'),
            ),
            const SizedBox(
              height: 20,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
