// ignore_for_file: file_names

class JokeModel {
  String? type;
  String? setup;
  String? punchline;
  int? id;

  JokeModel({this.type, this.setup, this.punchline, this.id});

  JokeModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    setup = json['setup'];
    punchline = json['punchline'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['setup'] = setup;
    data['punchline'] = punchline;
    data['id'] = id;
    return data;
  }
}
