import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> getImagePalette(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(
    imageProvider,
    size: Size(200, 100),
  );
  return paletteGenerator.dominantColor!.color;
}
