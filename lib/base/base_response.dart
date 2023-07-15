import 'dart:convert';

BaseResponse baseResponseFromJson(String str) =>
    BaseResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
  int? status;
  String? message;
  String? subMessage;

  BaseResponse({
    this.status,
    this.message,
    this.subMessage,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        status: json["status"],
        message: json["message"],
        subMessage: json["subMessage"],
      );

  BaseResponse fromJson(Map<String, dynamic> json) => BaseResponse(
        status: json["status"],
        message: json["message"],
        subMessage: json["subMessage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "subMessage": subMessage,
      };
}
