import 'dart:async';

import 'package:darelist_app/database/database.dart';
import 'package:darelist_app/model/dare.dart';

class DareDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Get All Todo items
  //Searches if query string was passed
  Future<List<Dare>> getDares({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(dareTABLE,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(dareTABLE, columns: columns);
    }

    List<Dare> dares = result.isNotEmpty
        ? result.map((item) => Dare.fromDatabaseJson(item)).toList()
        : [];
    return dares;
  }
}