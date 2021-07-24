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
        margin: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
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
                      fontFamily: 'Quicksand',
                      color: Theme.of(context).primaryColor.computeLuminance() >
                              0.5
                          ? Colors.black
                          : Colors.white,
                      fontSize: width * 0.04),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: Text('Pass'),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    primary: Theme.of(context).accentColor,
                    onPrimary:
                        Theme.of(context).accentColor.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white,
                    textStyle: TextStyle(
                        fontSize: width * 0.04, fontFamily: 'Lobster')),
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: Text('Fail'),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    primary: Theme.of(context).accentColor,
                    onPrimary:
                        Theme.of(context).accentColor.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white,
                    textStyle: TextStyle(
                        fontSize: width * 0.04, fontFamily: 'Lobster')),
              )
            ]),
          ],
        ));
  }
}
