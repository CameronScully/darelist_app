import 'package:darelist_app/UI/pack.dart';
import 'package:darelist_app/UI/pack_list.dart';
import 'package:flutter/material.dart';

class PackListPage extends Page {
  PackListPage() : super(key: ValueKey('PackListPage'));

  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: Offset.zero, end: Offset(-1.0, 0.0));
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation2.drive(curveTween).drive(tween),
          child: PackList(),
        );
      },
    );
  }
}
