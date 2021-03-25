import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function() onPressed;
  final Color? color;

  const CircleButton(
      {Key? key,
      required this.icon,
      required this.iconSize,
      required this.onPressed,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0,
      ),
      margin: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          icon: Center(
            child: Icon(
              icon,
              color: color,
            ),
          ),
          iconSize: iconSize,
          color: Colors.black,
          onPressed: onPressed,
          splashRadius: 20.0,
        ),
      ),
    );
  }
}
