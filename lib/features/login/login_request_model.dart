class LoginRequestModel {
  LoginRequestModel({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}