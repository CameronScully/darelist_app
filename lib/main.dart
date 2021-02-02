import 'package:darelist_app/UI/background.dart';
import 'package:darelist_app/UI/pack_section.dart';
import 'package:darelist_app/UI/title_section.dart';
import 'package:darelist_app/database/database.dart';
import 'UI/pack_list_screen.dart';
import 'navigation/pack_page.dart';
import 'file:///C:/Users/CameronScully/AndroidStudioProjects/darelist_app/lib/models/dare.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'models/pack.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*
  final Database db = await initilizeDatabase();
  final List<Map<String, dynamic>> maps = await db.query('dares');

  List<Dare> dares = List.generate(maps.length, (i) {
    return Dare(
      description: maps[i]['description'],
      difficulty: maps[i]['difficulty'],
      challengeable: maps[i]['challengeable'],
      nsfw: maps[i]['nsfw'],
    );
  });
   */
  runApp(DarelistApp());
}

class DarelistApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DarelistAppState();
}

class _DarelistAppState extends State<DarelistApp> {
  Pack _selectedPack;

  // TODO packs will actually be a collection of dares from the database
  List<Pack> packs = [
    Pack('Pack 1'),
    Pack('Pack 2'),
    Pack('Pack 3'),
    Pack('Pack 4'),
    Pack('Pack 5'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
              key: ValueKey('PackListPage'),
              child: PackListScreen(
                packs,
                _handlePackTapped,
              )),
          if (_selectedPack != null) PackPage(pack: _selectedPack)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _selectedPack = null;
          });

          return true;
        },
      ),
    );
  }

  void _handlePackTapped(Pack pack) {
    setState(() {
      _selectedPack = pack;
    });
  }
}
