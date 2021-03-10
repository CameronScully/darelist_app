import 'dart:convert';

DareModel dareFromJson(String str) {
  final jsonData = json.decode(str);
  return DareModel.fromMap(jsonData);
}

class DareModel {
  int id;
  final String description;
  final int difficulty;
  final bool challengeable;
  final bool nsfw;

  DareModel(
      {this.id,
      this.description,
      this.difficulty,
      this.challengeable,
      this.nsfw});

  factory DareModel.fromMap(Map<String, dynamic> data) => new DareModel(
        id: data['id'],
        description: data['description'],
        difficulty: data['difficulty'],
        challengeable: data['challengeable'] == 0 ? false : true,
        nsfw: data['nsfw'] == 0 ? false : true,
      );
}
