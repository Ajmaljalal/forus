import 'package:flutter/material.dart';

class LeftSideMenuItem {
  final String text;
  final IconData icon;
  final Function() onTap;

  const LeftSideMenuItem({
    required this.text,
    required this.icon,
    required this.onTap,
  });
}
