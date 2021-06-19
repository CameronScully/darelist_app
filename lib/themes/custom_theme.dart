import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get Theme1 {
    return ThemeData(
      backgroundColor: Palette1.color3,
      primaryColor: Palette1.color1,
      cardColor: Palette1.color2,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette1.color4,
          onPrimary: Palette1.color4.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette1.color2.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme2 {
    return ThemeData(
      backgroundColor: Palette2.color4,
      primaryColor: Palette2.color3,
      cardColor: Palette2.color2,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette2.color1,
          onPrimary: Palette2.color1.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette2.color2.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme3 {
    return ThemeData(
      backgroundColor: Palette3.color4,
      primaryColor: Palette3.color1,
      cardColor: Palette3.color3,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette3.color2,
          onPrimary: Palette3.color2.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette3.color3.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme4 {
    Color backgroundColor = Palette4.color3;
    Color primaryColor = Palette4.color1;
    Color cardColor = Palette4.color2;
    Color buttonColor = Palette4.color4;

    return ThemeData(
      backgroundColor: backgroundColor,
      primaryColor: primaryColor,
      cardColor: cardColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          onPrimary: buttonColor.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: cardColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme5 {
    return ThemeData(
      backgroundColor: Palette5.color2,
      primaryColor: Palette5.color4,
      cardColor: Palette5.color3,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette5.color1,
          onPrimary: Palette5.color1.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette5.color2.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme6 {
    return ThemeData(
      backgroundColor: Palette6.color1,
      primaryColor: Palette6.color2,
      cardColor: Palette6.color3,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette6.color4,
          onPrimary: Palette6.color4.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette6.color2.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme7 {
    return ThemeData(
      backgroundColor: Palette7.color4,
      primaryColor: Palette7.color2,
      cardColor: Palette7.color1,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette7.color3,
          onPrimary: Palette7.color3.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette7.color2.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme8 {
    return ThemeData(
      backgroundColor: Palette8.color1,
      primaryColor: Palette8.color4,
      cardColor: Palette8.color2,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette8.color3,
          onPrimary: Palette8.color3.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette8.color2.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme9 {
    return ThemeData(
      backgroundColor: Palette9.color3,
      primaryColor: Palette9.color4,
      cardColor: Palette9.color2,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette9.color1,
          onPrimary: Palette9.color1.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette9.color2.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }

  static ThemeData get Theme10 {
    return ThemeData(
      backgroundColor: Palette10.color4,
      primaryColor: Palette10.color3,
      cardColor: Palette10.color2,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Palette10.color1,
          onPrimary: Palette10.color1.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Palette10.color2.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            fontFamily: 'Lobster',
            fontSize: 30),
      ),
    );
  }
}
