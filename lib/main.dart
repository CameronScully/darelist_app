import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'navigation/darelist_router_delegate.dart';
import 'navigation/pack_route_information_parser.dart';
import 'navigation/ui_pages.dart';

void main() async {
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
      theme: ThemeData(
        backgroundColor: Color(0xFFFF2E63),
        primaryColor: Color(0xFF08D9D6),
        cardColor: Color(0xFF252A34),
      ),
    );
  }
}
