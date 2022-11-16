import 'package:flutter_developer_study_case/model/exercises_model.dart';
import 'package:http/http.dart' as http;

class ModelService {
  static var client = http.Client();
  Future<List<ExercisesModel>?> fetchModel() async {
    var response = await client.get(
      Uri.parse('https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises'),
      headers: {
        'X-RapidAPI-Key': 'f74303d910mshb3ee08875c770cdp1b039bjsnd4a97be04692',
        'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com',
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return exercisesModelFromJson(jsonString);
    } else {
      throw Exception("Datalar gelmedi");
      //return null;
    }


  }
}
