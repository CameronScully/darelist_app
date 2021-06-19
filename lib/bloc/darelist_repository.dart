import 'dares_dao.dart';

class TodoRepository {
  final todoDao = DaresDao();

  Future getDaresById(difficulty) => todoDao.getDares(difficulty);
}
