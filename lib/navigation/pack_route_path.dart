class PackRoutePath {
  final int id;
  final bool isUnknown;

  PackRoutePath.home()
      : id = null,
        isUnknown = false;

  PackRoutePath.details(this.id) : isUnknown = false;

  PackRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isPackListPage => id == null;

  bool get isPackPage => id != null;
}
