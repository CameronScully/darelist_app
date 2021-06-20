import 'dart:async';

import 'package:darelist_app/model/player.dart';

import 'darelist_repository.dart';

class PlayerBloc {
  //Get instance of the Repository
  final _darelistRepository = DarelistRepository();

  final _playerController = StreamController<List<Player>>.broadcast();

  get players => _playerController.stream;

  PlayerBloc() {
    getPlayers();
  }

  getPlayers() async {
    _playerController.sink.add(await _darelistRepository.getPlayers());
  }

  addPlayer(Player player) async {
    await _darelistRepository.insertPlayer(player);
    getPlayers();
  }

  updatePlayer(Player player) async {
    await _darelistRepository.updatePlayer(player);
    getPlayers();
  }

  deletePlayerById(int id) async {
    _darelistRepository.deletePlayerById(id);
    getPlayers();
  }

  deleteAllPlayers() async {
    _darelistRepository.deleteAllPlayers();
    getPlayers();
  }

  dispose() {
    _playerController.close();
  }
}
