import 'dart:async';

import 'package:darelist_app/model/dare_model.dart';
import 'package:darelist_app/repository/dare_repository.dart';

class DareBloc {
  //Get instance of the Repository
  final _dareRepository = DareRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _dareController = StreamController<List<DareModel>>.broadcast();

  get dares => _dareController.stream;

  DareBloc() {
    getDares();
  }

  getDares({String query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _dareController.sink.add(await _dareRepository.getAllDares(query: query));
  }

  dispose() {
    _dareController.close();
  }
}
