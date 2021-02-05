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
import 'navigation/pack_route_information_parser.dart';
import 'navigation/pack_router_delegate.dart';

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
  PackRouterDelegate _routerDelegate = PackRouterDelegate();
  PackRouteInformationParser _routeInformationParser =
      PackRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
