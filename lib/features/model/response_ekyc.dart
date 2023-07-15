import 'dart:convert';

import 'back_card_response.dart';
import 'front_card_response.dart';

ResponseEkyc responseEkycFromJson(String str) =>
    ResponseEkyc.fromJson(json.decode(str));

String responseEkycToJson(ResponseEkyc data) => json.encode(data.toJson());

class ResponseEkyc {
  ResponseEkyc({
    this.frontCardResponse,
    this.backCardResponse,
  });

  FrontCardResponse? frontCardResponse;
  BackCardResponse? backCardResponse;

  factory ResponseEkyc.fromJson(Map<String, dynamic> json) => ResponseEkyc(
        frontCardResponse:
            FrontCardResponse.fromJson(json["frontCardResponse"]),
        backCardResponse: BackCardResponse.fromJson(json["backCardResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "frontCardResponse":
            frontCardResponse != null ? frontCardResponse?.toJson() : null,
        "backCardResponse":
            backCardResponse != null ? backCardResponse?.toJson() : null,
      };
}
