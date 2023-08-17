// To parse this JSON data, do
//
//     final orderRequestModel = orderRequestModelFromJson(jsonString);

import 'dart:convert';

import 'package:sweet_smash_app/modules/products/state/cart_state.dart';

OrderRequestModel orderRequestModelFromJson(String str) =>
    OrderRequestModel.fromJson(json.decode(str));

String orderRequestModelToJson(OrderRequestModel data) =>
    json.encode(data.toJson());

class OrderRequestModel {
  int userId;
  int paymentTypeId;
  List<ProductInCart> productsInOrder;

  OrderRequestModel({
    required this.userId,
    required this.paymentTypeId,
    required this.productsInOrder,
  });

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>
      OrderRequestModel(
        userId: json["userId"],
        paymentTypeId: json["paymentTypeId"],
        productsInOrder: List<ProductInCart>.from(
            json["productsInOrder"].map((x) => ProductInCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "paymentTypeId": paymentTypeId,
        "productsInOrder":
            List<dynamic>.from(productsInOrder.map((x) => x.toJson())),
      };
}

class ProductsInOrder {
  int quantity;
  int productId;

  ProductsInOrder({
    required this.quantity,
    required this.productId,
  });

  factory ProductsInOrder.fromJson(Map<String, dynamic> json) =>
      ProductsInOrder(
        quantity: json["quantity"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "productId": productId,
      };
}
