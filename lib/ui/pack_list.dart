import 'package:darelist_app/ui/pack.dart';
import 'package:darelist_app/navigation/darelist_router_delegate.dart';
import 'package:darelist_app/navigation/ui_pages.dart';
import 'package:darelist_app/ui/title_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'background.dart';
import 'dare_widget.dart';
import 'pack_section.dart';

class PackList extends StatelessWidget {
  //TODO dynamically set colors from a random master pallete
  final Color backgroundColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final delegate = Get.find<DarelistRouterDelegate>();

    List<Pack> packs = [
      Pack("Friendly Pack"),
      Pack("Party Pack"),
      Pack("Challenge Pack"),
      Pack("Spicy Pack"),
      Pack("Impossible Pack")
    ];

    return Scaffold(
      backgroundColor: this.backgroundColor,
      body: Stack(
        children: [
          Background(this.backgroundColor),
          ListView(
            children: [
              TitleSection(),
              for (var pack in packs)
                GestureDetector(
                  onTap: () => delegate.pushWidget(pack, PackPageConfig),
                  child: PackSection(1, pack.name),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
