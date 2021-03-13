import 'package:flutter/material.dart';

class ColorPalette {
  static const Color scaffold = Color(0x11a6b1b7);
  static const Color primary = Color(0xFF010101);
  static const Color secondary = Color(0xFFee1d52);
  static const Color hover = Color(0x11a6b1b7);
  static const Color selected = Color(0x11a6b1b7);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
