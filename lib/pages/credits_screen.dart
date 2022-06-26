import 'package:flutter/material.dart';
import 'package:overdrive/components/header.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(
              title: 'Credits',
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 800,
                  child: Column(
                    children: const [
                      Text('Built with love by:'),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Elias Reis'),
                      Text('Erick Zanardo'),
                      Text('Felix Angelov'),
                      Text('Luan Nico'),
                      Text('Renan Araujo'),
                      Text('Tyemy Kuga'),
                      SizedBox(
                        height: 16,
                      ),
                      Text('For the BIG Game Jam!'),
                      SizedBox(
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
