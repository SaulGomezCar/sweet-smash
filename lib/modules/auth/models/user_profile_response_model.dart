// To parse this JSON data, do
//
//     final userProfileResponseModel = userProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UserProfileResponseModel userProfileResponseModelFromJson(String str) => UserProfileResponseModel.fromJson(json.decode(str));

String userProfileResponseModelToJson(UserProfileResponseModel data) => json.encode(data.toJson());

class UserProfileResponseModel {
    UserProfile data;
    bool success;
    String message;

    UserProfileResponseModel({
        required this.data,
        required this.success,
        required this.message,
    });

    factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => UserProfileResponseModel(
        data: UserProfile.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
        "message": message,
    };
}

class UserProfile {
    int id;
    String name;
    String lastname;
    String email;

    UserProfile({
        required this.id,
        required this.name,
        required this.lastname,
        required this.email,
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
    };
}
