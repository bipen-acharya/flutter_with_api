import 'dart:convert';

class LoginUser {
  LoginUser({
    required this.email,
    required this.password,
  });
  static LoginUser loginUserFromJson(String str) =>
      LoginUser.fromJson(json.decode(str));

  static String loginUserToJson(LoginUser data) => json.encode(data.toJson());

  String email;
  String password;

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
