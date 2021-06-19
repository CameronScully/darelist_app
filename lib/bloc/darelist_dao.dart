import 'dart:async';

import 'package:darelist_app/database/database.dart';
import 'package:darelist_app/model/dare.dart';

class DarelistDao {
  final dbProvider = DatabaseProvider.dbProvider;

  // Get dares with x difficulty
  // can be moved into sepperate tables later for speed
  Future<List<Dare>> getDares(difficulty) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result =
        await db.rawQuery("SELECT * FROM dares WHERE difficulty = $difficulty");

    List<Dare> dares = result.isNotEmpty
        ? result.map((item) => Dare.fromDatabaseJson(item)).toList()
        : [];

    return dares;
  }
}
