import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function() onPressed;
  final Color? color;
  final String? tooltip;

  const CircleButton(
      {Key? key,
      required this.icon,
      required this.iconSize,
      required this.onPressed,
      this.tooltip,
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
          tooltip: tooltip,
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
