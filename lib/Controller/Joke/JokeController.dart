// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_joke/Model/Joke/JokeModel.dart';

class JokeController {
  static Future<JokeModel> getModel() async {
    final url = Uri.parse('https://official-joke-api.appspot.com/random_joke');

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Host': 'official-joke-api.appspot.com',
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonResponse = jsonDecode(response.body);
        return JokeModel.fromJson(jsonResponse);
      } else {
        print(response.statusCode);
        throw Exception('Something went wrong, please try again later');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
