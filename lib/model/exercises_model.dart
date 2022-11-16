/*class Exercises_Model {
  String? name;
  String? type;
  String? muscle;
  String? equipment;
  String? difficulty;
  String? instructions;

  Exercises_Model(
      {this.name,
      this.type,
      this.muscle,
      this.equipment,
      this.difficulty,
      this.instructions});

  Exercises_Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    muscle = json['muscle'];
    equipment = json['equipment'];
    difficulty = json['difficulty'];
    instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['muscle'] = this.muscle;
    data['equipment'] = this.equipment;
    data['difficulty'] = this.difficulty;
    data['instructions'] = this.instructions;
    return data;
  }
}*/
// To parse this JSON data, do
//
//     final exercisesModel = exercisesModelFromJson(jsonString);

import 'dart:convert';

List<ExercisesModel> exercisesModelFromJson(String str) => List<ExercisesModel>.from(json.decode(str).map((x) => ExercisesModel.fromJson(x)));

String exercisesModelToJson(List<ExercisesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExercisesModel {
    ExercisesModel({
        this.name,
        this.type,
        this.muscle,
        this.equipment,
        this.difficulty,
        this.instructions,
    });

    String? name;
    String ?type;
    String ?muscle;
    String ?equipment;
    String ?difficulty;
    String ?instructions;

    factory ExercisesModel.fromJson(Map<String, dynamic> json) => ExercisesModel(
        name: json["name"],
        type: json["type"],
        muscle: json["muscle"],
        equipment: json["equipment"],
        difficulty: json["difficulty"],
        instructions: json["instructions"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "muscle": muscle,
        "equipment": equipment,
        "difficulty": difficulty,
        "instructions": instructions,
    };
}
