import 'package:darelist_app/model/pack.dart';
import 'package:flutter/material.dart';

class DareWidget extends StatelessWidget {
  final String dareText;

  //TODO dynamically set colors from a random master pallete
  final Color backgroundColor = Colors.white;

  DareWidget(this.dareText);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(color: backgroundColor),
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
                color: Colors.red[900].withOpacity(0.8),
                offset: Offset(0, 15),
              ),
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dareText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
