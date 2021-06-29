import 'dart:async';

import 'package:darelist_app/database/database.dart';
import 'package:darelist_app/model/dare.dart';
import 'package:darelist_app/model/player.dart';

class DarelistDao {
  final dbProvider = DatabaseProvider.dbProvider;

  // Get dares with x difficulty
  // can be moved into sepperate packs later for speed
  Future<List<Dare>> getDares(difficulty) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result =
        await db.rawQuery("SELECT * FROM dares WHERE difficulty = $difficulty");

    List<Dare> dares = result.isNotEmpty
        ? result.map((item) => Dare.fromDatabaseJson(item)).toList()
        : [];

    dares.shuffle();

    return dares;
  }

  Future<List<Player>> getPlayers() async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result =
        await db.rawQuery("SELECT * FROM players");

    List<Player> players = result.isNotEmpty
        ? result.map((item) => Player.fromDatabaseJson(item)).toList()
        : [];

    return players;
  }

  // add player
  Future<int> createPlayer(Player player) async {
    final db = await dbProvider.database;
    var result = db.insert('players', player.toDatabaseJson());
    return result;
  }

  // update player
  Future<int> updatePlayer(Player player) async {
    final db = await dbProvider.database;

    var result = await db.update('players', player.toDatabaseJson(),
        where: "id = ?", whereArgs: [player.id]);

    return result;
  }

  // delete player
  Future<int> deletePlayer(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete('players', where: 'id = ?', whereArgs: [id]);

    return result;
  }

  // Delete all players
  Future deleteAllPlayers() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      'players',
    );

    return result;
  }
}
