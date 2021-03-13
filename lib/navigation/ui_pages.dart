import 'package:flutter/cupertino.dart';

const String PackListPath = '/packList';
const String PackPath = '/pack';

enum Pages { PackList, Pack }

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;

  const PageConfiguration(
      {@required this.key, @required this.path, @required this.uiPage});
}

const PageConfiguration PackListPageConfig = PageConfiguration(
    key: 'PackList', path: PackListPath, uiPage: Pages.PackList);

const PageConfiguration PackPageConfig =
    PageConfiguration(key: 'Pack', path: PackPath, uiPage: Pages.Pack);
