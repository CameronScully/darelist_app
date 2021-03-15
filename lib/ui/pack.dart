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
            return Stack(
              children: [
                Background(),
                Scaffold(
                  appBar: AppBar(
                    title: TitleSection(),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    centerTitle: true,
                    toolbarHeight: MediaQuery.of(context).size.height * 0.25,
                  ),
                  backgroundColor: Colors.transparent,
                  body: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      children: snapshot.data),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
