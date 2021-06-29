import 'package:darelist_app/UI/pack.dart';
import 'package:darelist_app/navigation/players_page.dart';
import 'package:darelist_app/navigation/ui_pages.dart';
import 'package:flutter/material.dart';

import 'pack_list_page.dart';
import 'pack_page.dart';

class DarelistRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<Page> _pages = [];
  final GlobalKey<NavigatorState> navigatorKey;

  DarelistRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _pages.remove(route.settings);
    notifyListeners();

    return true;
  }

  void _removePage(MaterialPage page) {
    if (page != null) {
      _pages.remove(page);
    }
    notifyListeners();
  }

  /*
  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }
   */

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(child: child, key: ValueKey(child));
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            pageConfig.uiPage;

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.PackList:
          _pages.add(
            PackListPage(),
          );
          break;
        // case Pages.Players:
        //   _pages.add(
        //     PlayersPage(),
        //   );
        //   break;
        default:
          break;
      }

      notifyListeners();
    }
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
    notifyListeners();
  }

  void replaceAll(PageConfiguration newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
    notifyListeners();
  }

  //test if we can push a pack page to override animation
  void pushPack(Pack pack) {
    _pages.add(PackPage(pack));
    notifyListeners();
  }

  //these all could be one function
  void pushPlayers() {
    _pages.add(PlayersPage());
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration pageData) {
    _pages.clear();
    addPage(pageData);
    return Future.value(null);
  }
}
