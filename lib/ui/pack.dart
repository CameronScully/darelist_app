import 'package:darelist_app/database/database_provider.dart';
import 'package:darelist_app/ui/dare_widget.dart';
import 'package:darelist_app/ui/title_section.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Pack extends StatelessWidget {
  final String name;
  final int difficulty;

  Pack(this.name, this.difficulty);

  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);

    return FutureBuilder<List<DareWidget>>(
        future: DatabaseProvider.db.getDares(difficulty),
        builder: (context, AsyncSnapshot<List<DareWidget>> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                backgroundColor: Colors.blue,
                body: Stack(
                  children: [
                    Background(Colors.blue),
                    TitleSection(),
                    PageView(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        children: snapshot.data)
                  ],
                ));
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
