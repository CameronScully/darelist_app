class Player {
  int id;
  String name;
  Player({this.id, this.name});

  factory Player.fromDatabaseJson(Map<String, dynamic> data) =>
      Player(id: data['id'], name: data['name']);

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "name": this.name,
      };
}
