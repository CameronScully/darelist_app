import 'package:darelist_app/bloc/dare_bloc.dart';
import 'package:darelist_app/model/dare_model.dart';
import 'package:darelist_app/model/pack.dart';
import 'package:darelist_app/navigation/darelist_router_delegate.dart';
import 'package:darelist_app/navigation/ui_pages.dart';
import 'package:darelist_app/repository/dare_repository.dart';
import 'package:darelist_app/ui/title_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'background.dart';
import 'dare_widget.dart';
import 'pack_section.dart';
/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Database db = await initilizeDatabase();
  final List<Map<String, dynamic>> maps = await db.query('dares');

  List<Dare> dares = List.generate(maps.length, (i) {
    return Dare(
      description: maps[i]['description'],
      difficulty: maps[i]['difficulty'],
      challengeable: maps[i]['challengeable'],
      nsfw: maps[i]['nsfw'],
    );
  });
   */

class PackList extends StatelessWidget {
  final DareRepository dareRepository = DareRepository();

  final List<DareWidget> pack1Dares = [
    DareWidget("fake dare 1"),
    DareWidget("fake dare 2")
  ];

  final List<DareWidget> pack2Dares = [
    DareWidget("fake dare 1"),
    DareWidget("fake dare 2")
  ];

  //TODO dynamically set colors from a random master pallete
  final Color backgroundColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final delegate = Get.find<DarelistRouterDelegate>();

    List<Pack> packs = [Pack("Pack 1", pack1Dares), Pack("Pack 2", pack2Dares)];

    final DareBloc dareBloc = DareBloc();

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
                  onTap: () => delegate.pushWidgets(pack.dares, DarePageConfig),
                  child: PackSection(1, pack.packname),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
