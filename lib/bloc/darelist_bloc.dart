import 'dart:async';

import 'package:darelist_app/model/dare.dart';

import 'darelist_repository.dart';

class DarelistBloc {
  //Get instance of the Repository
  final _darelistRepository = DarelistRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _dareController = StreamController<List<Dare>>.broadcast();

  get dares => _dareController.stream;

  DarelistBloc(int difficulty) {
    getDares(difficulty);
  }

  getDares(int difficulty) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _dareController.sink.add(await _darelistRepository.getDares(difficulty));
  }

  dispose() {
    print("disposed");
    _dareController.close();
  }
}
