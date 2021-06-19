import 'package:darelist_app/UI/background.dart';
import 'package:darelist_app/UI/dare_widget.dart';
import 'package:darelist_app/UI/pack.dart';
import 'package:darelist_app/UI/pack_section.dart';
import 'package:darelist_app/UI/title_section.dart';
import 'package:darelist_app/database/database.dart';
import 'package:darelist_app/navigation/darelist_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final delegate = Get.find<DarelistRouterDelegate>();

    List<Pack> packs = [
      Pack("Friendly Pack", 1),
      Pack("Party Pack", 2),
      Pack("Challenge Pack", 3),
      Pack("Spicy Pack", 4),
      Pack("Impossible Pack", 5)
    ];

    return Stack(
      children: [
        Container(
            color: Theme.of(context).backgroundColor, child: Background()),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              AppBar(
                title: TitleSection(),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                centerTitle: true,
                toolbarHeight: MediaQuery.of(context).size.height * 0.25,
              ),
              for (var pack in packs)
                GestureDetector(
                  onTap: () => delegate.pushPack(pack),
                  child: PackSection(pack.difficulty, pack.name),
                ),
            ],
          ),
        )
      ],
    );
  }
}
