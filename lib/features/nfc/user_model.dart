class UserModel {
  UserModel({
    this.code,
    this.firstName,
    this.lastName,
    this.country,
    this.gender,
    this.dateOfBirth,
    this.dateOfExpiry,
    this.nationality,
    this.image,
    this.digitalSignatural,
    this.dg15,
  });

  String? code;
  String? firstName;
  String? lastName;
  String? country;
  String? gender;
  String? dateOfBirth;
  String? dateOfExpiry;
  String? nationality;
  String? image;
  String? digitalSignatural;
  String? dg15;

  // factory UserModel.fromJson(Map<String, dynamic> json){
  //     return UserModel(
  //         code: json["code"],
  //         firstName: json["firstName"],
  //         lastName: json["lastName"],
  //         surName: json["surName"],
  //         gender: json["gender"],
  //         dateOfBirth: json["dateOfBirth"],
  //         dateOfExpiry: json["dateOfExpiry"],
  //     );
  // }

  // Map<String, dynamic> toJson() => {
  //     "code": code,
  //     "firstName": firstName,
  //     "lastName": lastName,
  //     "surName": surName,
  //     "gender": gender,
  //     "dateOfBirth": dateOfBirth,
  //     "dateOfExpiry": dateOfExpiry,
  // };

}
