import 'package:darelist_app/UI/pack.dart';
import 'package:flutter/material.dart';

class PackPage extends Page {
  final Pack pack;

  PackPage(this.pack) : super(key: ValueKey(pack));

  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: pack,
        );
      },
    );
  }
}
