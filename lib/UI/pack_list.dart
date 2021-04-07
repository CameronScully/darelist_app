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
    final pageController = PageController(initialPage: 999);
    //Future<List<DareWidget>> pack1Dares = DatabaseProvider.db.getDares("Friendly Pack");
    Future<List<DareWidget>> pack1Dares =
        DatabaseProvider.db.getDares(1, pageController);
    Future<List<DareWidget>> pack2Dares =
        DatabaseProvider.db.getDares(2, pageController);
    Future<List<DareWidget>> pack3Dares =
        DatabaseProvider.db.getDares(3, pageController);
    Future<List<DareWidget>> pack4Dares =
        DatabaseProvider.db.getDares(4, pageController);
    Future<List<DareWidget>> pack5Dares =
        DatabaseProvider.db.getDares(5, pageController);

    //difficulty and name need to be hardcoded so that they load before db dares
    List<Pack> packs = [
      Pack("Friendly Pack", 1, pack1Dares, pageController),
      Pack("Party Pack", 2, pack2Dares, pageController),
      Pack("Challenge Pack", 3, pack3Dares, pageController),
      Pack("Spicy Pack", 4, pack4Dares, pageController),
      Pack("Impossible Pack", 5, pack5Dares, pageController)
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
