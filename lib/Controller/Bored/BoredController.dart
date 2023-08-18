// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_joke/Model/Bored/BoredModel.dart';

class BoredController {
  static Future<BoredModel> getModel() async {
    final url = Uri.parse('https://www.boredapi.com/api/activity');

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Host': 'www.boredapi.com',
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonResponse = jsonDecode(response.body);
        return BoredModel.fromJson(jsonResponse);
      } else {
        print(response.statusCode);
        throw Exception('Something went wrong, please try again later');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
