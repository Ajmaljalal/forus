import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:forus/configs/color_palette.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Color? color;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: 28.0,
      ),
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: onTap,
      splashRadius: 20.0,
      iconSize: 20.0,
      mouseCursor: SystemMouseCursors.click,
      color: ColorPalette.primary,
    );
  }
}
