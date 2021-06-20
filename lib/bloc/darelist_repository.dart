import 'package:darelist_app/model/player.dart';

import 'darelist_dao.dart';

class DarelistRepository {
  final darelistDao = DarelistDao();

  Future getDares(int difficulty) => darelistDao.getDares(difficulty);

  Future getPlayers() => darelistDao.getPlayers();

  Future insertPlayer(Player player) => darelistDao.createPlayer(player);

  Future updatePlayer(Player player) => darelistDao.updatePlayer(player);

  Future deletePlayerById(int id) => darelistDao.deletePlayer(id);

  Future deleteAllPlayers() => darelistDao.deleteAllPlayers();
}
