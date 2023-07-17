class UserInformation {
  UserInformation({
    this.name,
    this.birthday,
    this.gender,
    this.address,
    this.createDate,
  });

  String? name;
  String? birthday;
  String? gender;
  String? address;
  String? createDate;

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    return UserInformation(
      name: json["name"],
      birthday: json["birthday"],
      gender: json["gender"],
      address: json["address"],
      createDate: json["createDate"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "birthday": birthday,
        "gender": gender,
        "address": address,
        "createDate": createDate,
      };
}
