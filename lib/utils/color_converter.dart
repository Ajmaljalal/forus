import 'dart:ui';

Color getColorFromColorCode(String code) {
  return Color(int.parse(code.substring(1, 6)));
}
