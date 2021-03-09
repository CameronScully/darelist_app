import 'package:darelist_app/model/dare_model.dart';
import 'package:darelist_app/ui/dare_widget.dart';
import 'package:flutter/cupertino.dart';

class Pack {
  final String packname;
  final List<DareWidget> dares;

  Pack(this.packname, this.dares);
}
