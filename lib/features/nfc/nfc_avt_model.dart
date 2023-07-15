class NfcAvtModelResponse {
  NfcAvtModelResponse({
    this.statusCode,
  });

  int? statusCode;

  factory NfcAvtModelResponse.fromJson(Map<String, dynamic> json) {
    return NfcAvtModelResponse(
      statusCode: json["status_code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
      };
}
