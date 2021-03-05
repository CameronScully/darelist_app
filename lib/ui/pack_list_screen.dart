import 'package:darelist_app/ui/title_section.dart';
import 'package:darelist_app/model/pack.dart';
import 'package:flutter/material.dart';

import 'background.dart';
import 'pack_section.dart';

class PackListScreen extends StatelessWidget {
  final List<Pack> packs;
  final ValueChanged<Pack> onTapped;

  PackListScreen(
    this.packs,
    this.onTapped,
  );

  //TODO dynamically set colors from a random master pallete
  Color backgroundColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.backgroundColor,
      body: Stack(
        children: [
          Background(this.backgroundColor),
          ListView(
            children: [
              TitleSection(),
              for (var pack in packs)
                //TODO pack difficulty
                GestureDetector(
                  onTap: () => onTapped(pack),
                  child: PackSection(1, pack.packname),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
