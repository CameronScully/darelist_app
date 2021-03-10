import 'package:darelist_app/model/dare_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'database/database_provider.dart';
import 'navigation/darelist_router_delegate.dart';
import 'navigation/pack_route_information_parser.dart';
import 'navigation/ui_pages.dart';

void main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  final List<DareModel> dares = await DatabaseProvider.db.getAllDares();
  print(dares[0].description);
   */

  runApp(DarelistApp());
}

class DarelistApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DarelistAppState();
}

class _DarelistAppState extends State<DarelistApp> {
  final delegate = DarelistRouterDelegate();
  final parser = PackRouteInformationParser();

  _DarelistAppState() {
    delegate.setNewRoutePath(PackListPageConfig);
    Get.put(delegate);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  }
}
