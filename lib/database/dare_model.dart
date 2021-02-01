
class DareModel {

  final String description;
  final int difficulty;
  final String challengeable;
  final String nsfw;

  DareModel({this.description, this.difficulty, this.challengeable, this.nsfw});

  // Convert a Dog into a Map. The keys must correspond to the names of the
    // columns in the database.
    Map<String, dynamic> toMap() {
      return {
        'description': description,
        'difficulty': difficulty,
        'challengeable': challengeable,
        'nsfw': nsfw
      };
    }
}