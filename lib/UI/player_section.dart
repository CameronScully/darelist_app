import 'package:darelist_app/bloc/player_bloc.dart';
import 'package:darelist_app/model/player.dart';
import 'package:flutter/material.dart';

class PlayerSection extends StatelessWidget {
  final Player player;
  final PlayerBloc playerBloc = PlayerBloc();
  final myController;

  PlayerSection({this.player})
      : myController = TextEditingController(text: player.name);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    myController.selection = TextSelection.fromPosition(
        TextPosition(offset: myController.text.length));
    return Container(
      margin: EdgeInsets.all(width * 0.01),
      padding: EdgeInsets.all(width * 0.01),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: new BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Focus(
            child: TextField(
                controller: myController,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lobster',
                    fontSize: width * 0.04),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onEditingComplete: () {
                  player.name = myController.text;
                  playerBloc.updatePlayer(player);
                },
                onSubmitted: (_) => FocusScope.of(context).unfocus()),
            canRequestFocus: false,
            onFocusChange: (hasFocus) {
              if (!hasFocus) {
                player.name = myController.text;
                playerBloc.updatePlayer(player);
              }
            },
          )),
        ],
      ),
    );
  }
}
