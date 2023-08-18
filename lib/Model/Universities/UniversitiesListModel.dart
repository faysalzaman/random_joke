class UniversitiesListModel {
  List<String>? webPages;
  List<String>? domains;
  String? country;
  String? name;
  String? stateProvince;
  String? alphaTwoCode;

  UniversitiesListModel(
      {this.webPages,
      this.domains,
      this.country,
      this.name,
      this.stateProvince,
      this.alphaTwoCode});

  UniversitiesListModel.fromJson(Map<String, dynamic> json) {
    webPages = json['web_pages'].cast<String>();
    domains = json['domains'].cast<String>();
    country = json['country'];
    name = json['name'];
    stateProvince = json['state-province'];
    alphaTwoCode = json['alpha_two_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['web_pages'] = webPages;
    data['domains'] = domains;
    data['country'] = country;
    data['name'] = name;
    data['state-province'] = stateProvince;
    data['alpha_two_code'] = alphaTwoCode;
    return data;
  }
}
