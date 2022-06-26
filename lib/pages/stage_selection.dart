import 'package:flutter/material.dart';

class StageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/'),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const Text(
              'Stages',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
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
                        onTap: () => Navigator.of(context).pushNamed('/game'),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0XFF9575cd),
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
                            color: Color(0XFF55018C),
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
