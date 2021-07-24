import 'package:darelist_app/UI/background.dart';
import 'package:darelist_app/UI/pack_section.dart';
import 'package:darelist_app/UI/player_section.dart';
import 'package:darelist_app/UI/title_section.dart';
import 'package:darelist_app/bloc/player_bloc.dart';
import 'package:darelist_app/model/player.dart';
import 'package:darelist_app/navigation/darelist_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Players extends StatelessWidget {
  final PlayerBloc playerBloc = PlayerBloc();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            Container(
                color: Theme.of(context).backgroundColor, child: Background()),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: ListView(
                children: [
                  AppBar(
                      title: TitleSection("+ Players"),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      centerTitle: true,
                      toolbarHeight: MediaQuery.of(context).size.height * 0.2,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_rounded, size: 40),
                        onPressed: () => Navigator.of(context).pop(),
                      )),
                  StreamBuilder(
                      stream: playerBloc.players,
                      builder: (context, AsyncSnapshot<List<Player>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: [
                              ListView.builder(
                                  itemCount: snapshot.data.length,
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Dismissible(
                                      onDismissed: (direction) {
                                        playerBloc.deletePlayerById(
                                            snapshot.data[index].id);
                                      },
                                      direction: DismissDirection.horizontal,
                                      key: new ObjectKey(snapshot.data[index]),
                                      child: PlayerSection(
                                          player: snapshot.data[index]),
                                    );
                                  }),
                              GestureDetector(
                                onTap: () => {
                                  playerBloc.addPlayer(Player(
                                      name:
                                          "Player ${snapshot.data.length + 1}")),
                                  FocusScope.of(context).unfocus(),
                                },
                                child: Container(
                                  margin: EdgeInsets.all(width * 0.01),
                                  padding: EdgeInsets.all(width * 0.01),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(20.0)),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                  ),
                                  child: Icon(Icons.add_circle,
                                      size: 40, color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
