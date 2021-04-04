import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Text(
          "Dare List",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Lobster',
            fontSize: width * 0.08,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = (width * 0.015)
              ..color = Theme.of(context).primaryColor,
          ),
        ),
        Text(
          "Dare List",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lobster',
            fontSize: width * 0.08,
          ),
        ),
      ],
    );
  }
}
