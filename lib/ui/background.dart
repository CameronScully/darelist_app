import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:geopattern_flutter/geopattern_flutter.dart';
import 'package:geopattern_flutter/patterns/mosaic_squares.dart';

class Background extends StatelessWidget {
  Color backgroundColor;

  Background(this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    final hash = sha1.convert(utf8.encode("flutter")).toString();
    return LayoutBuilder(builder: (context, constraints) {
      final pattern = MosaicSquares.fromHash(hash);
      return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: FullPainter(pattern: pattern, background: Colors.red));
    });
  }
}
