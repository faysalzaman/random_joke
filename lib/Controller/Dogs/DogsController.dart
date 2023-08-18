// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class DogsController {
  static Future<String> getModel() async {
    final url = Uri.parse('https://dog.ceo/api/breeds/image/random');

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Host': 'dog.ceo',
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['message'];
      } else {
        print(response.statusCode);
        throw Exception('Something went wrong, please try again later');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
