// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:random_joke/Model/Universities/UniversitiesListModel.dart';
import 'package:http/http.dart' as http;

class UniversityListController {
  Future<List<UniversitiesListModel>> getModel() async {
    final url = Uri.parse(
        'http://universities.hipolabs.com/search?country=United+States');

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Host': 'universities.hipolabs.com',
      'Accept': 'application/json'
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonResponse = jsonDecode(response.body) as List;
        var json = jsonResponse
            .map((university) => UniversitiesListModel.fromJson(university))
            .toList();
        return json;
      } else {
        print(response.statusCode);
        throw Exception('No data found');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
