import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  late final String token;
  late final String userId;

  LoginResponseModel({required this.token, required this.userId});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['userId'] = userId;
    return data;
  }
}
