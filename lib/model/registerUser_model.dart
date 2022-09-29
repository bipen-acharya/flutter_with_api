import 'dart:convert';

class RegisterUser {
  RegisterUser({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });
  static RegisterUser registerUserFromJson(String str) =>
      RegisterUser.fromJson(json.decode(str));

  static String registerUserToJson(RegisterUser data) =>
      json.encode(data.toJson());

  String email;
  String name;
  String phone;
  String password;

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "phone": phone,
        "password": password,
      };
}
