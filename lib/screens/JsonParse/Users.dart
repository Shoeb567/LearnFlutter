// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.code,
    this.unicode,
    this.name,
    this.emoji,
  });

  String code;
  String unicode;
  String name;
  String emoji;

  factory User.fromJson(Map<String, dynamic> json) => User(
    code: json["code"],
    unicode: json["unicode"],
    name: json["name"],
    emoji: json["emoji"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "unicode": unicode,
    "name": name,
    "emoji": emoji,
  };
}
