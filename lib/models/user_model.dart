// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String status;
  String accountId;
  String firstname;
  String lastname;
  String email;
  String hasXo;
  String expiryXo;
  String companyId;
  String type;
  String profileImage;

  UserModel({
    required this.status,
    required this.accountId,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.hasXo,
    required this.expiryXo,
    required this.companyId,
    required this.type,
    required this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"] ?? "",
        accountId: json["accountID"] ?? "",
        firstname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "",
        email: json["email"] ?? "",
        hasXo: json["hasXO"] ?? "",
        expiryXo: json["expiryXO"] ?? "",
        companyId: json["companyID"] ?? "",
        type: json["type"] ?? "",
        profileImage: json["profileImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "accountID": accountId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "hasXO": hasXo,
        "expiryXO": expiryXo,
        "companyID": companyId,
        "type": type,
        "profileImage": profileImage,
      };
}
