// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {

  String? password;

  String? number;

  UserModel({

    this.password,

    this.number,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(

        password: json["password"],

        number: json["number"],
      );

  Map<String, dynamic> toJson() => {

        "password": password,

        "number": number,
      };
}
