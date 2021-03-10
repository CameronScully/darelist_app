import 'package:darelist_app/database/database_provider.dart';
import 'package:darelist_app/model/dare_model.dart';
import 'package:darelist_app/ui/dare_widget.dart';
import 'package:flutter/material.dart';

class Pack extends StatelessWidget {
  final String name;

  Pack(this.name);

  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);

    return FutureBuilder<List<DareWidget>>(
        future: DatabaseProvider.db.getAllDares(),
        builder: (context, AsyncSnapshot<List<DareWidget>> snapshot) {
          if (snapshot.hasData) {
            return PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                children: snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
