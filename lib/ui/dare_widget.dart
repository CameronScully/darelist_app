import 'package:darelist_app/ui/title_section.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class DareWidget extends StatelessWidget {
  final String dareText;
  final int difficulty;

  //TODO dynamically set colors from a random master pallete
  final Color backgroundColor = Colors.white;

  DareWidget(this.dareText, this.difficulty);

  factory DareWidget.fromMap(Map<String, dynamic> data) => new DareWidget(
        data['description'],
        data['difficulty'],
      );

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

    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Background(Colors.blue),
            TitleSection(),
            Center(
                child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: size.height * 0.50,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius:
                              new BorderRadius.all(Radius.circular(20.0)),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  dareText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Lobster',
                                    fontSize: 30,
                                  ),
                                )
                              ],
                            )
                          ],
                        ))))
          ],
        ));
  }
}
