import 'dart:math';

import 'package:darelist_app/UI/dare_widget.dart';
import 'package:darelist_app/UI/title_section.dart';
import 'package:darelist_app/UI/versus_widget.dart';
import 'package:darelist_app/bloc/darelist_bloc.dart';
import 'package:darelist_app/bloc/player_bloc.dart';
import 'package:darelist_app/model/dare.dart';
import 'package:darelist_app/model/player.dart';
import 'package:darelist_app/navigation/darelist_router_delegate.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'background.dart';
import 'package:get/get.dart';

class Pack extends StatelessWidget {
  final String name;
  final int difficulty;
  final DarelistBloc darelistBloc;
  final PlayerBloc playerBloc = PlayerBloc();

  final pageController = PageController(initialPage: 999);

  Pack(this.name, this.difficulty) : darelistBloc = DarelistBloc(difficulty);

  @override
  Widget build(BuildContext context) {
    darelistBloc.getDares(difficulty);
    playerBloc.getPlayers();
    var rng = new Random();

    final width = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    final delegate = Get.find<DarelistRouterDelegate>();

    return Stack(
      children: [
        Container(
            color: Theme.of(context).backgroundColor, child: Background()),
        Scaffold(
          appBar: AppBar(
              title: TitleSection("Dare List"),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
              toolbarHeight: MediaQuery.of(context).size.height * 0.25,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_rounded, size: 40),
                onPressed: () => Navigator.of(context).pop(),
              )),
          backgroundColor: Colors.transparent,
          body: StreamBuilder(
              stream: darelistBloc.dares,
              builder: (context, AsyncSnapshot<List<Dare>> snapshot) {
                return StreamBuilder(
                    stream: playerBloc.players,
                    builder: (context, AsyncSnapshot<List<Player>> snapshot2) {
                      if (snapshot.hasData && snapshot2.hasData) {
                        snapshot2.data.shuffle();
                        return PageView.builder(
                          physics: new NeverScrollableScrollPhysics(),
                          controller: pageController,
                          itemBuilder: (context, index) {
                            Dare dare =
                                snapshot.data[index % snapshot.data.length];

                            Player player;

                            Player judge;

                            if (snapshot2.data.length == 0) {
                              player = Player(name: "Player");
                              judge = Player(name: "Judge");
                            } else if (snapshot2.data.length == 0) {
                              player =
                                  snapshot2.data[index % snapshot2.data.length];
                              judge = Player(name: "Judge");
                            } else {
                              player =
                                  snapshot2.data[index % snapshot2.data.length];

                              judge = snapshot2
                                  .data[rng.nextInt(snapshot2.data.length)];

                              while (judge == player) {
                                judge = snapshot2
                                    .data[rng.nextInt(snapshot2.data.length)];
                              }
                            }

                            return new Center(
                                child: FlipCard(
                                    front:
                                        VersusWidget(judge.name, player.name),
                                    back: DareWidget(
                                        dare.description, pageController)));
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    });
              }),
        )
      ],
    );
  }

  dispose() {
    /*close the stream in order
    to avoid memory leaks
    */
    darelistBloc.dispose();
  }
}
