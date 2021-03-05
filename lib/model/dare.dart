class Dare {
  int id;
  final String description;
  final int difficulty;
  final bool challengeable;
  final bool nsfw;

  Dare(
      {this.id,
      this.description,
      this.difficulty,
      this.challengeable,
      this.nsfw});

  factory Dare.fromDatabaseJson(Map<String, dynamic> data) => Dare(
        //This will be used to convert JSON objects that
        //are coming from querying the database and converting
        //it into a Todo object
        id: data['id'],
        description: data['description'],
        difficulty: data['difficulty'],
        //Since sqlite doesn't have boolean type for true/false
        //we will 0 to denote that it is false
        //and 1 for true
        challengeable: data['challengeable'] == 0 ? false : true,
        nsfw: data['nsfw'] == 0 ? false : true,
      );

  // Convert a dare into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toDatabaseJson() => {
        'id': id,
        'description': description,
        'difficulty': difficulty,
        'challengeable': challengeable,
        'nsfw': nsfw
      };
}
