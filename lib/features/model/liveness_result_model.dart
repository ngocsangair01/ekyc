// To parse this JSON data, do
//
//     final livenessResultModel = livenessResultModelFromJson(jsonString);

import 'dart:convert';

LivenessResultModel livenessResultModelFromJson(String str) =>
    LivenessResultModel.fromJson(json.decode(str));

String livenessResultModelToJson(LivenessResultModel data) =>
    json.encode(data.toJson());

class LivenessResultModel {
  String? status;
  double? percent;
  String? pathFrontImg;
  String? pathUserImg;
  String? user;
  String? createdDate;

  LivenessResultModel({
    this.status,
    this.percent,
    this.pathFrontImg,
    this.pathUserImg,
    this.user,
    this.createdDate,
  });

  factory LivenessResultModel.fromJson(Map<String, dynamic> json) =>
      LivenessResultModel(
        status: json["status"],
        percent: json["percent"]?.toDouble(),
        pathFrontImg: json["path_frontImg"],
        pathUserImg: json["path_userImg"],
        user: json["user"],
        createdDate: json["created_date"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "percent": percent,
        "path_frontImg": pathFrontImg,
        "path_userImg": pathUserImg,
        "user": user,
        "created_date": createdDate,
      };
}
