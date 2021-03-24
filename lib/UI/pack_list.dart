import 'package:darelist_app/UI/background.dart';
import 'package:darelist_app/UI/dare_widget.dart';
import 'package:darelist_app/UI/pack.dart';
import 'package:darelist_app/UI/pack_section.dart';
import 'package:darelist_app/UI/title_section.dart';
import 'package:darelist_app/database/database_provider.dart';
import 'package:darelist_app/navigation/darelist_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final delegate = Get.find<DarelistRouterDelegate>();

    /*
    Pack should be something like
    drinking
    sexy
    friendly
    challenging
     */

    //Future<List<DareWidget>> pack1Dares = DatabaseProvider.db.getDares("Friendly Pack");
    Future<List<DareWidget>> pack1Dares = DatabaseProvider.db.getDares(1);
    Future<List<DareWidget>> pack2Dares = DatabaseProvider.db.getDares(2);
    Future<List<DareWidget>> pack3Dares = DatabaseProvider.db.getDares(3);
    Future<List<DareWidget>> pack4Dares = DatabaseProvider.db.getDares(4);
    Future<List<DareWidget>> pack5Dares = DatabaseProvider.db.getDares(5);

    //difficulty and name need to be hardcoded so that they load before db dares
    List<Pack> packs = [
      Pack("Friendly Pack", 1, pack1Dares),
      Pack("Party Pack", 2, pack2Dares),
      Pack("Challenge Pack", 3, pack3Dares),
      Pack("Spicy Pack", 4, pack4Dares),
      Pack("Impossible Pack", 5, pack5Dares)
    ];

    return Stack(
      children: [
        Background(),
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
