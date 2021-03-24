import 'package:flutter/material.dart';

class PackSection extends StatelessWidget {
  int difficulty;
  String packName;

  PackSection(int difficulty, String packName) {
    this.difficulty = difficulty;
    this.packName = packName;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    List<Image> _chilliRating() {
      List<Image> chilli = [];
      for (int i = 0; i < difficulty; i++) {
        chilli
            .add(Image.asset('assets/images/chilli.png', width: width * 0.05));
      }
      return chilli;
    }

    return Container(
      margin: EdgeInsets.only(
          left: width * 0.04, right: width * 0.04, bottom: width * 0.04),
      height: width * 0.20,
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: new BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 7),
          ),
          BoxShadow(
            color: Colors.grey[200],
            offset: Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                packName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lobster',
                  fontSize: width * 0.04,
                ),
              ),
            ],
          ),
          Container(
            //padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _chilliRating(),
            ),
          ),
        ],
      ),
    );
  }
}
