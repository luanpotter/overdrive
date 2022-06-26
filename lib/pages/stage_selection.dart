import 'package:flutter/material.dart';

class StageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Stages',
            style: TextStyle(fontSize: 30),
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
                        color: Colors.blue,
                        child: const Center(
                          child: Text('1'),
                        ),
                      ),
                    ),
                    for (int i = 2; i <= 20; i++)
                      Container(
                        color: Colors.blue,
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
    );
  }
}
