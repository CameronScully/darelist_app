import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.25,
      child: Center(
          child: Stack(
        children: [
          Text(
            "Dare List",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 50,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 10
                ..color = Colors.blue[700],
            ),
          ),
          Text(
            "Dare List",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lobster',
              fontSize: 50,
            ),
          ),
        ],
      )),
    );
  }
}
