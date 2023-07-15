// To parse this JSON data, do
//
//     final backCardResponse = backCardResponseFromJson(jsonString);

import 'dart:convert';

BackCardResponse backCardResponseFromJson(String str) =>
    BackCardResponse.fromJson(json.decode(str));

String backCardResponseToJson(BackCardResponse data) =>
    json.encode(data.toJson());

class BackCardResponse {
  Data? data;
  String? detail;
  String? type;

  BackCardResponse({
    this.data,
    this.detail,
    this.type,
  });

  factory BackCardResponse.fromJson(Map<String, dynamic> json) =>
      BackCardResponse(
        data: Data.fromJson(json["data"]),
        detail: json["detail"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "detail": detail,
        "type": type,
      };
}

class Data {
  String? characteristic;
  String? characteristic2;
  String? dateOfIssue;
  Mrz? mrz;
  String? placeOfIssue2;
  String? dirPath;
  String? placeOfIssue;

  Data({
    this.characteristic,
    this.characteristic2,
    this.dateOfIssue,
    this.mrz,
    this.placeOfIssue2,
    this.dirPath,
    this.placeOfIssue,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        characteristic: json["Characteristic"],
        characteristic2: json["Characteristic_2"],
        dateOfIssue: json["Date_of_issue"],
        mrz: Mrz.fromJson(json["MRZ"]),
        placeOfIssue2: json["Place_of_issue_2"],
        dirPath: json["dir_path"],
        placeOfIssue: json["Place_of_issue"],
      );

  Map<String, dynamic> toJson() => {
        "Characteristic": characteristic,
        "Characteristic_2": characteristic2,
        "Date_of_issue": dateOfIssue,
        "MRZ": mrz?.toJson(),
        "Place_of_issue_2": placeOfIssue2,
        "dir_path": dirPath,
        "Place_of_issue": placeOfIssue,
      };
}

class Mrz {
  List<String>? raw;
  String? documentType;
  String? countryCode;
  String? sexCode;
  String? dobYear;
  String? randomNumber;
  String? idNumber;
  String? dobYymmdd;
  String? sex;
  String? expYymmdd;
  String? nationalityCode;
  String? fullName;
  String? key;

  Mrz({
    this.raw,
    this.documentType,
    this.countryCode,
    this.sexCode,
    this.dobYear,
    this.randomNumber,
    this.idNumber,
    this.dobYymmdd,
    this.sex,
    this.expYymmdd,
    this.nationalityCode,
    this.fullName,
    this.key,
  });

  factory Mrz.fromJson(Map<String, dynamic> json) => Mrz(
        raw: List<String>.from(json["raw"].map((x) => x)),
        documentType: json["document_type"],
        countryCode: json["country_code"],
        sexCode: json["sex_code"],
        dobYear: json["dob_year"],
        randomNumber: json["random_number"],
        idNumber: json["id_number"],
        dobYymmdd: json["dob_yymmdd"],
        sex: json["sex"],
        expYymmdd: json["exp_yymmdd"],
        nationalityCode: json["nationality_code"],
        fullName: json["full name"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw != null ? List<dynamic>.from(raw!.map((x) => x)) : null,
        "document_type": documentType,
        "country_code": countryCode,
        "sex_code": sexCode,
        "dob_year": dobYear,
        "random_number": randomNumber,
        "id_number": idNumber,
        "dob_yymmdd": dobYymmdd,
        "sex": sex,
        "exp_yymmdd": expYymmdd,
        "nationality_code": nationalityCode,
        "full name": fullName,
        "key": key,
      };
}
