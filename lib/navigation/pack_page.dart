import 'package:darelist_app/model/pack.dart';
import 'package:flutter/material.dart';

import '../UI/pack_screen.dart';

class PackPage extends Page {
  final Pack pack;

  PackPage(this.pack) : super(key: ValueKey(pack));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return PackScreen(pack);
      },
    );
  }
}
