import 'package:flutter/material.dart';

import 'pack_route_path.dart';

class PackRouteInformationParser extends RouteInformationParser<PackRoutePath> {
  @override
  Future<PackRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    print(uri.pathSegments.length);
    if (uri.pathSegments.length == 0) {
      return PackRoutePath.home();
    }

    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'pack') return PackRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return PackRoutePath.unknown();
      return PackRoutePath.details(id);
    }

    // Handle unknown routes
    return PackRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(PackRoutePath path) {
    if (path.isPackListPage) {
      return RouteInformation(location: '/');
    }
    if (path.isPackPage) {
      return RouteInformation(location: '/pack/${path.id}');
    }
    return null;
  }
}
