import 'package:darelist_app/UI/pack_list_screen.dart';
import 'package:darelist_app/models/pack.dart';
import 'package:flutter/material.dart';
import 'pack_page.dart';
import 'pack_route_path.dart';

class PackRouterDelegate extends RouterDelegate<PackRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PackRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Pack _selectedPack;

  // TODO packs will actually be a collection of dares from the database
  List<Pack> packs = [
    Pack('Pack 1'),
    Pack('Pack 2'),
    Pack('Pack 3'),
    Pack('Pack 4'),
    Pack('Pack 5'),
  ];

  PackRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  PackRoutePath get currentConfiguration {
    return _selectedPack == null
        ? PackRoutePath.home()
        : PackRoutePath.details(packs.indexOf(_selectedPack));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('PackListPage'),
          child: PackListScreen(
            packs,
            _handlePackTapped,
          ),
        ),
        if (_selectedPack != null) PackPage(_selectedPack)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedPack = null;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PackRoutePath path) async {
    if (path.isPackPage) {
      _selectedPack = packs[path.id];
    } else {
      _selectedPack = null;
    }
  }

  void _handlePackTapped(Pack pack) {
    _selectedPack = pack;
    notifyListeners();
  }
}
