class Dare {
  String description;
  Dare(this.description);

  factory Dare.fromDatabaseJson(Map<String, dynamic> data) =>
      Dare(data['description']);
}
