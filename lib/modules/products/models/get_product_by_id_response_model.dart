import 'dart:convert';
import 'package:sweet_smash_app/modules/products/models/get_all_products_response_model.dart';

GetProductByIdResponseModel getProductByIdResponseModelFromJson(String str) =>
    GetProductByIdResponseModel.fromJson(json.decode(str));

String getProductByIdResponseModelToJson(GetProductByIdResponseModel data) =>
    json.encode(data.toJson());

class GetProductByIdResponseModel {
  Product data;
  bool success;
  String message;

  GetProductByIdResponseModel({
    required this.data,
    required this.success,
    required this.message,
  });

  factory GetProductByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GetProductByIdResponseModel(
        data: Product.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
        "message": message,
      };
}
