import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:geopattern_flutter/geopattern_flutter.dart';
import 'package:geopattern_flutter/patterns/chevrons.dart';
import 'package:geopattern_flutter/patterns/concentric_circles.dart';
import 'package:geopattern_flutter/patterns/diamonds.dart';
import 'package:geopattern_flutter/patterns/hexagons.dart';
import 'package:geopattern_flutter/patterns/mosaic_squares.dart';
import 'package:geopattern_flutter/patterns/nested_squares.dart';
import 'package:geopattern_flutter/patterns/octagons.dart';
import 'package:geopattern_flutter/patterns/overlapping_circles.dart';
import 'package:geopattern_flutter/patterns/overlapping_rings.dart';
import 'package:geopattern_flutter/patterns/plaid.dart';
import 'package:geopattern_flutter/patterns/plus_signs.dart';
import 'package:geopattern_flutter/patterns/sine_waves.dart';
import 'package:geopattern_flutter/patterns/squares.dart';
import 'package:geopattern_flutter/patterns/triangles.dart';

//canvas.drawColor(background, BlendMode.dstOver);

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hash = sha1.convert(utf8.encode("flutter")).toString();
    return LayoutBuilder(builder: (context, constraints) {
      final pattern = Chevrons.fromHash(hash);
      //final pattern = ConcentricCircles.fromHash(hash);
      //final pattern = Diamonds.fromHash(hash);
      //final pattern = Hexagons.fromHash(hash);
      //final pattern = MosaicSquares.fromHash(hash);
      //final pattern = NestedSquares.fromHash(hash);
      //final pattern = Octagons.fromHash(hash);
      //final pattern = Squares.fromHash(hash);
      //final pattern = Triangles.fromHash(hash);

      return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: FullPainter(
              pattern: pattern, background: Theme.of(context).backgroundColor));
    });
  }
}
