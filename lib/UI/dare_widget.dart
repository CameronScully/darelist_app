import 'package:flutter/material.dart';

class DareWidget extends StatelessWidget {
  final String dareText;
  final int difficulty;
  final PageController pageController;

  DareWidget(this.dareText, this.difficulty, this.pageController);

  factory DareWidget.fromMap(
          Map<String, dynamic> data, PageController pageController) =>
      new DareWidget(
        data['description'],
        data['difficulty'],
        pageController,
      );

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      dareText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Text('PASS'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                        textStyle: TextStyle(
                            fontSize: 30, fontFamily: 'RanchersRegular')),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Text('FAIL'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        textStyle: TextStyle(
                            fontSize: 30, fontFamily: 'RanchersRegular')),
                  )
                ],
              )
            ]),
          ],
        ));
  }
}
