import 'package:darelist_app/UI/background.dart';
import 'package:darelist_app/UI/pack_section.dart';
import 'package:darelist_app/UI/title_section.dart';
import 'package:darelist_app/database/database.dart';
import 'package:darelist_app/database/dare_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.

  final Database db = await initilizeDatabase();
  final List<Map<String, dynamic>> maps = await db.query('dares');

  print(List.generate(maps.length, (i) {
    return DareModel(
      description: maps[i]['description'],
      difficulty: maps[i]['difficulty'],
      challengeable: maps[i]['challengeable'],
      nsfw: maps[i]['nsfw'],
    );
  })[0]
      .description);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color backgroundColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
          backgroundColor: this.backgroundColor,
          body: Stack(
            children: [
              Background(this.backgroundColor),
              ListView(
                children: [
                  TitleSection(),
                  PackSection(1, 'Pack 1'),
                  PackSection(1, 'Pack 2'),
                  PackSection(2, 'Pack 3'),
                  PackSection(2, 'Pack 4'),
                  PackSection(3, 'Pack 5'),
                ],
              ),
            ],
          ),
        ));
  }
}
