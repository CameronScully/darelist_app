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
    final size = MediaQuery.of(context).size;

    List<Image> _chilliRating() {
      List<Image> chilli = [];
      for (int i = 0; i < difficulty; i++) {
        chilli.add(
            Image.asset('assets/images/chilli.png', width: size.width * 0.075));
      }
      return chilli;
    }

    return Container(
        padding: const EdgeInsets.only(left: 20, bottom: 40, right: 20),
        height: size.height * 0.20,
        child: Container(
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
                      fontSize: 30,
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
        ));
  }
}
