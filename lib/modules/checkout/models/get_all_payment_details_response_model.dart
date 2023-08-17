// To parse this JSON data, do
//
//     final getAllPaymentDetailsResponseModel = getAllPaymentDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

GetAllPaymentDetailsResponseModel getAllPaymentDetailsResponseModelFromJson(
        String str) =>
    GetAllPaymentDetailsResponseModel.fromJson(json.decode(str));

String getAllPaymentDetailsResponseModelToJson(
        GetAllPaymentDetailsResponseModel data) =>
    json.encode(data.toJson());

class GetAllPaymentDetailsResponseModel {
  List<PaymentDetail> data;
  bool success;
  String message;

  GetAllPaymentDetailsResponseModel({
    required this.data,
    required this.success,
    required this.message,
  });

  factory GetAllPaymentDetailsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetAllPaymentDetailsResponseModel(
        data: List<PaymentDetail>.from(json["data"].map((x) => PaymentDetail.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class PaymentDetail {
  int id;
  String name;
  String label;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentDetail({
    required this.id,
    required this.name,
    required this.label,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
        id: json["id"],
        name: json["name"],
        label: json["label"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "label": label,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
