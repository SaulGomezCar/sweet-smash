import 'dart:convert';

RegisterResponseModel registerResponseJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  late final Object? data;
  late final bool success;
  late final String message;

  RegisterResponseModel({
    required this.data,
    required this.success,
    required this.message,
  });

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
