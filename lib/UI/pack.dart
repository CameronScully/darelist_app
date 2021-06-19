import 'package:darelist_app/UI/dare_widget.dart';
import 'package:darelist_app/UI/title_section.dart';
import 'package:darelist_app/bloc/darelist_bloc.dart';
import 'package:darelist_app/model/dare.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Pack extends StatelessWidget {
  final String name;
  final int difficulty;
  final DarelistBloc darelistBloc;

  final pageController = PageController(initialPage: 999);

  Pack(this.name, this.difficulty) : darelistBloc = DarelistBloc(difficulty);

  @override
  Widget build(BuildContext context) {
    darelistBloc.getDares(difficulty);
    return Stack(
      children: [
        Container(
            color: Theme.of(context).backgroundColor, child: Background()),
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
            body: StreamBuilder(
                stream: darelistBloc.dares,
                builder: (context, AsyncSnapshot<List<Dare>> snapshot) {
                  if (snapshot.hasData) {
                    return PageView.builder(
                      controller: pageController,
                      itemBuilder: (context, index) {
                        Dare dare = snapshot.data[index % snapshot.data.length];
                        return new Center(
                          child: DareWidget(
                              dare.description, difficulty, pageController),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }))
      ],
    );
  }

  dispose() {
    /*close the stream in order
    to avoid memory leaks
    */
    darelistBloc.dispose();
  }
}
