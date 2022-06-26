import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                child: Text('Play'),
                onPressed: () => Navigator.of(context).pushNamed('/game'),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                child: Text('Settings'),
                onPressed: () => {},
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                child: Text('Credits'),
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
