class BoredModel {
  String? activity;
  String? type;
  num? participants;
  num? price;
  String? link;
  String? key;
  num? accessibility;

  BoredModel(
      {this.activity,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key,
      this.accessibility});

  BoredModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
    link = json['link'];
    key = json['key'];
    accessibility = json['accessibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activity;
    data['type'] = type;
    data['participants'] = participants;
    data['price'] = price;
    data['link'] = link;
    data['key'] = key;
    data['accessibility'] = accessibility;
    return data;
  }
}
