import 'package:meta/meta.dart';
import 'dart:convert';

class UserDetails {
  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerified,
    required this.phone,
    required this.createdAt,
  });
  static UserDetails userDetailsFromJson(String str) =>
      UserDetails.fromJson(json.decode(str));

  static String userDetailsToJson(UserDetails data) =>
      json.encode(data.toJson());

  int id;
  String name;
  String email;
  bool emailVerified;
  String phone;
  DateTime createdAt;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "emailVerified": emailVerified,
        "phone": phone,
        "createdAt": createdAt.toIso8601String(),
      };
}
