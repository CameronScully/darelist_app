import 'package:flutter/material.dart';

class DareWidget extends StatelessWidget {
  final String dareText;
  final PageController pageController;

  DareWidget(this.dareText, this.pageController);

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
            Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  dareText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                      fontSize: width * 0.04),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: Text('PASS'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.black,
                    textStyle: TextStyle(
                        fontSize: width * 0.04, fontFamily: 'Lobster')),
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: Text('FAIL'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.black,
                    textStyle: TextStyle(
                        fontSize: width * 0.04, fontFamily: 'Lobster')),
              )
            ]),
          ],
        ));
  }
}
