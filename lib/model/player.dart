class Player {
  int id;
  String name;
  Player(this.id, this.name);

  factory Player.fromDatabaseJson(Map<String, dynamic> data) =>
      Player(data['id'], data['name']);

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "name": this.name,
      };
}
