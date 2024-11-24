import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum Direction{left, right}

class NavigatorIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Direction direction;
  const NavigatorIcon({super.key, required this.onPressed, required this.direction});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: 36,
        width: 36,
        decoration: const BoxDecoration(
          color: Colors.white, // Set the background color here
          shape: BoxShape.circle, // Circle shape
        ),
        child: Center(
          child: Icon(
            direction == Direction.left ? PhosphorIcons.caretLeft() : PhosphorIcons.caretRight(),
            size: 16,
          ),
        ),
      ),
    );
  }
}
