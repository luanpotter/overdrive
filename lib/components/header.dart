import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Monoton',
            fontSize: 50,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
