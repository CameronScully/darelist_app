import 'package:flutter/material.dart';

class VersusWidget extends StatelessWidget {
  String judge;
  String player;
  VersusWidget(this.judge, this.player);

  @override
  Widget build(BuildContext context) {
    //will set height to width if landscape
    final width = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: new BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Center(
                            child: Text(
                          judge,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lobster',
                              fontSize: width * 0.04),
                        )))),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20, top: 10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Center(
                            child: Text(
                          player,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lobster',
                              fontSize: width * 0.04),
                        )))),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Text(
                        "VS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lobster',
                            fontSize: width * 0.04),
                      )),
                )
              ],
            ),
          ],
        ));
  }
}
