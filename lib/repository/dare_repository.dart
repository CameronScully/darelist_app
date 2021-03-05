
import 'package:darelist_app/dao/dare_doa.dart';

class DareRepository {
  final dareDao = DareDao();

  Future getAllDares({String query}) => dareDao.getDares(query: query);
}