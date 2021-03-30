import 'package:darelist_app/database/database_provider.dart';
import 'package:darelist_app/UI/dare_widget.dart';
import 'package:darelist_app/UI/title_section.dart';
import 'package:flutter/material.dart';
import 'background.dart';

class Pack extends StatelessWidget {
  final String name;
  final int difficulty;
  final Future<List<DareWidget>> dares;
  final PageController pageController;

  Pack(this.name, this.difficulty, this.dares, this.pageController);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DareWidget>>(
        future: dares,
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
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_rounded, size: 40),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  body: new PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return new Center(
                        child: snapshot.data[index % snapshot.data.length],
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
