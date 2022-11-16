import 'dart:convert';
import 'dart:developer';

import 'dart:io';

import 'package:flutter_developer_study_case/model/exercises_model.dart';

import 'package:flutter_developer_study_case/services/service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {
  //Exercises_Model? exercises_model;
  final ModelService _modelService = ModelService();
  ExercisesModel? exercisesModel;
  var isDataLoading = false.obs;

  var modelList = <ExercisesModel>[].obs;

  var foundList = <ExercisesModel>[].obs;
  var selectedList = List<ExercisesModel>.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchModel();
    super.onInit();
    foundList.value = modelList;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void filterModel(String name) {
    List<ExercisesModel> results = [];
    if (name.isEmpty) {
      results = modelList;
    } else {
      results = modelList
          .where((element) => element.muscle
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList();
    }
    foundList.value = results;
  }

  void fetchModel() async {
    try {
      isDataLoading(true);
      var modeller = await _modelService.fetchModel();

      if (modeller != null) {
        modelList.value = modeller;
        // foundList.value = modeller;
      }
    } finally {
      isDataLoading(false);

      // TODO
    }
  }
  /*Future<List<ExercisesModel>?>  getSearch(String searchText)async{
        try {
      isDataLoading(true);
      var modeller = await _modelService.fetchModel();

      if (modeller != null&&modelList.value.contains(searchText)) {
        modelList.value = modeller;
      }
    } finally {
      isDataLoading(false);

      // TODO
    }
   
  }*/

  /*getApi() async {
    try {
      isDataLoading(true);
      http.Response response = await http.get(
        Uri.parse(
            'https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises'),
        /* Uri.tryParse(
            'https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises')!,*/
        headers: {
          /* 'X-RapidAPI-Key':
              'f74303d910mshb3ee08875c770cdp1b039bjsnd4a97be04692',
          'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com',*/
          HttpHeaders.authorizationHeader:
              'f74303d910mshb3ee08875c770cdp1b039bjsnd4a97be04692',
          HttpHeaders.hostHeader: 'exercises-by-api-ninjas.p.rapidapi.com'
        },
      );
      if (response.statusCode == 200) {
        ///data successfully

        var result = jsonDecode(response.body);

        exercisesModel = ExercisesModel.fromJson(result);
      } else {
        ///error
      }
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      isDataLoading(false);
    }
  }*/
}
