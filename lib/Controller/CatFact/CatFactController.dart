// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class CatFactController {
  static Future<String> getModel() async {
    final url = Uri.parse('https://catfact.ninja/fact');

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Host': 'catfact.ninja',
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['fact'];
      } else {
        print(response.statusCode);
        throw Exception('Something went wrong, please try again later');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
