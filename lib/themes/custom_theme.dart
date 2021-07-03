import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get Theme {
    Color backgroundColor = Palette3.color1;
    Color primaryColor = Palette3.color2;
    Color cardColor = Palette3.color3;
    Color accentColor = Palette3.color4;

    return ThemeData(
      backgroundColor: backgroundColor,
      primaryColor: primaryColor,
      cardColor: cardColor,
      accentColor: accentColor,
    );
  }
}
