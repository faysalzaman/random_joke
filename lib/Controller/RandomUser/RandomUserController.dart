// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:random_joke/Model/RandomUser/RamdomUserModel.dart';
import 'package:http/http.dart' as http;

class RandomUserController {
  Future<RandomUserModel> getModel() async {
    final url = Uri.parse('https://randomuser.me/api/');

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Host': 'randomuser.me',
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonResponse = jsonDecode(response.body);
        RandomUserModel user =
            RandomUserModel.fromJson(jsonResponse['results'][0]);
        return user;
      } else {
        print(response.statusCode);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
