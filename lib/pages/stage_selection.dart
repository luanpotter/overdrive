import 'package:flutter/material.dart';
import 'package:overdrive/components/header.dart';

class StageSelection extends StatelessWidget {
  const StageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Header(
              title: 'Stages',
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 800,
                  child: GridView.count(
                    padding: const EdgeInsets.all(50),
                    crossAxisCount: 5,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/character_selection'),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0XFF9575cd),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ),
                      ),
                      for (int i = 2; i <= 20; i++)
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0XFF55018C),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.lock,
                            ),
                          ),
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
