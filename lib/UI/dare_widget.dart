import 'package:flutter/material.dart';

class DareWidget extends StatelessWidget {
  final String dareText;
  final int difficulty;

  DareWidget(this.dareText, this.difficulty);

  factory DareWidget.fromMap(Map<String, dynamic> data) => new DareWidget(
        data['description'],
        data['difficulty'],
      );

  @override
  Widget build(BuildContext context) {
    //will set height to width if landscape
    final width = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    List<Image> _chilliRating() {
      List<Image> chilli = [];
      for (int i = 0; i < difficulty; i++) {
        chilli.add(
            //height should just be small medium or large
            Image.asset('assets/images/chilli.png', width: width * 0.05));
      }
      return chilli;
    }

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
            Container(
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: _chilliRating(),
              ),
            ),
            Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      dareText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ))),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('PASS'))
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('FAIL'))
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
