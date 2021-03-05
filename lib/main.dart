import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'navigation/pack_route_information_parser.dart';
import 'navigation/pack_router_delegate.dart';

void main() async {
  runApp(DarelistApp());
}

class DarelistApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DarelistAppState();
}

class _DarelistAppState extends State<DarelistApp> {
  PackRouterDelegate _routerDelegate = PackRouterDelegate();
  PackRouteInformationParser _routeInformationParser =
      PackRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
