class NfcRequest {
  NfcRequest({
    this.firstName,
    this.lastName,
    this.documentNumber,
    this.idNumber,
    this.gender,
    this.country,
    this.nationality,
    this.dateOfBirthc,
    this.dateOfExpire,
    this.caIssuer,
    this.caSerialNumber,
  });

  String? firstName;
  String? lastName;
  String? documentNumber;
  String? idNumber;
  String? gender;
  String? country;
  String? nationality;
  String? dateOfBirthc;
  String? dateOfExpire;
  String? caIssuer;
  String? caSerialNumber;

  factory NfcRequest.fromJson(Map<String, dynamic> json) {
    return NfcRequest(
      firstName: json["FirstName"],
      lastName: json["LastName"],
      documentNumber: json["DocumentNumber"],
      idNumber: json["IDNumber"],
      gender: json["Gender"],
      country: json["Country"],
      nationality: json["Nationality"],
      dateOfBirthc: json["DateOfBirthc"],
      dateOfExpire: json["DateOfExpire"],
      caIssuer: json["CA_Issuer"],
      caSerialNumber: json["CA_SerialNumber"],
    );
  }

  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "DocumentNumber": documentNumber,
        "IDNumber": idNumber,
        "Gender": gender,
        "Country": country,
        "Nationality": nationality,
        "DateOfBirthc": dateOfBirthc,
        "DateOfExpire": dateOfExpire,
        "CA_Issuer": caIssuer,
        "CA_SerialNumber": caSerialNumber,
      };
}
