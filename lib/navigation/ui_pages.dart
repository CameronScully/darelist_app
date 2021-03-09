import 'package:flutter/cupertino.dart';

const String PackListPath = '/packList';
const String DarePath = '/dare';

enum Pages { PackList, Dare }

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;

  const PageConfiguration(
      {@required this.key, @required this.path, @required this.uiPage});
}

const PageConfiguration PackListPageConfig = PageConfiguration(
    key: 'PackList', path: PackListPath, uiPage: Pages.PackList);

const PageConfiguration DarePageConfig =
    PageConfiguration(key: 'Dare', path: DarePath, uiPage: Pages.Dare);
