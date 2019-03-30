import 'package:flutter/material.dart';

class UIConst {
  static final Color primary = HexColor("#5471ff");
  static final Color backgroundContent = HexColor("#f5f6fa");
  static final Color cardBackground = HexColor("#ffffff");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}