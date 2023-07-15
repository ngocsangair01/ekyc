// To parse this JSON data, do
//
//     final frontCardResponse = frontCardResponseFromJson(jsonString);

import 'dart:convert';

FrontCardResponse frontCardResponseFromJson(String str) =>
    FrontCardResponse.fromJson(json.decode(str));

String frontCardResponseToJson(FrontCardResponse data) =>
    json.encode(data.toJson());

class FrontCardResponse {
  String? pathFrontImg;
  String? frontFacePath;
  Data? data;
  String? detail;

  FrontCardResponse({
    this.pathFrontImg,
    this.frontFacePath,
    this.data,
    this.detail,
  });

  factory FrontCardResponse.fromJson(Map<String, dynamic> json) =>
      FrontCardResponse(
        pathFrontImg: json["path_frontImg"],
        frontFacePath: json["frontFacePath"],
        data: Data.fromJson(json["data"]),
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "path_frontImg": pathFrontImg,
        "frontFacePath": frontFacePath,
        "data": data?.toJson(),
        "detail": detail,
      };
}

class Data {
  String? idNumber;
  String? name;
  String? dateOfBirth;
  String? sex;
  String? nationality;
  String? homeTown;
  String? address;
  String? address2;
  String? expired;
  String? dirPath;

  Data({
    this.idNumber,
    this.name,
    this.dateOfBirth,
    this.sex,
    this.nationality,
    this.homeTown,
    this.address,
    this.address2,
    this.expired,
    this.dirPath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idNumber: json["Id_number"],
        name: json["Name"],
        dateOfBirth: json["Date_of_Birth"],
        sex: json["Sex"],
        nationality: json["Nationality"],
        homeTown: json["Home_town"],
        address: json["Address"],
        address2: json["Address_2"],
        expired: json["Expired"],
        dirPath: json["dir_path"],
      );

  Map<String, dynamic> toJson() => {
        "Id_number": idNumber,
        "Name": name,
        "Date_of_Birth": dateOfBirth,
        "Sex": sex,
        "Nationality": nationality,
        "Home_town": homeTown,
        "Address": address,
        "Address_2": address2,
        "Expired": expired,
        "dir_path": dirPath,
      };
}
