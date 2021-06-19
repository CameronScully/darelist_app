import 'darelist_dao.dart';

class DarelistRepository {
  final darelistDao = DarelistDao();

  Future getDares(int difficulty) => darelistDao.getDares(difficulty);
}
