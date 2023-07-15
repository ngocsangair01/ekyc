class Area {
  int? id;
  String? code;
  String? parentcode;
  String? name;
  int? status;
  int? region;

  Area(
      {this.id,
      this.code,
      this.parentcode,
      this.name,
      this.status,
      this.region});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    parentcode = json['parentcode'];
    name = json['name'];
    status = json['status'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['parentcode'] = this.parentcode;
    data['name'] = this.name;
    data['status'] = this.status;
    data['region'] = this.region;
    return data;
  }
}
