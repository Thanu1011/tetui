// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.username,
    this.fullname,
    this.id,
  });

  String username;
  String fullname;
  int id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"],
    fullname: json["fullname"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "fullname": fullname,
    "id": id,
  };
}
