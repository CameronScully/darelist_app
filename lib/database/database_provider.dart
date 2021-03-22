import 'dart:io';
import 'dart:typed_data';

import 'package:darelist_app/UI/dare_widget.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "database.db");
    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "database.db"));

      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    return await openDatabase(path);
  }

  Future<List<DareWidget>> getAllDares() async {
    final db = await database;
    var res = await db.query("dares");
    List<DareWidget> list =
        res.map((dares) => DareWidget.fromMap(dares)).toList();
    return list;
  }

  //should be given back in a random order
  Future<List<DareWidget>> getDares(int difficulty) async {
    print("getDares called");
    final db = await database;
    var res = await db
        .rawQuery("SELECT * FROM dares WHERE difficulty = ${difficulty}");
    List<DareWidget> list =
        res.map((dares) => DareWidget.fromMap(dares)).toList();

    list.shuffle();

    return list;
  }
}
