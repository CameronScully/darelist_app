import 'package:darelist_app/navigation/ui_pages.dart';
import 'package:flutter/material.dart';

class PackRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.isEmpty) {
      return PackListPageConfig;
    }

    final path = uri.pathSegments[0];

    switch (path) {
      case PackListPath:
        return PackListPageConfig;
      case PackPath:
        return PackPageConfig;
      default:
        return PackListPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case Pages.PackList:
        return const RouteInformation(location: PackListPath);
      case Pages.Pack:
        return const RouteInformation(location: PackPath);
      default:
        return const RouteInformation(location: PackListPath);
    }
  }
}
