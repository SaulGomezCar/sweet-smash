import 'dart:convert';

GetAllProductsResponseModel getAllProductsResponseModelFromJson(String str) => GetAllProductsResponseModel.fromJson(json.decode(str));

String getAllProductsResponseModelToJson(GetAllProductsResponseModel data) => json.encode(data.toJson());

class GetAllProductsResponseModel {
    List<Product> data;
    bool success;
    String message;

    GetAllProductsResponseModel({
        required this.data,
        required this.success,
        required this.message,
    });

    factory GetAllProductsResponseModel.fromJson(Map<String, dynamic> json) => GetAllProductsResponseModel(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "success": success,
        "message": message,
    };
}

class Product {
    int id;
    String name;
    String label;
    String description;
    double unitPrice;
    List<String> images;
    Stock stock;
    DateTime createdAt;
    DateTime updatedAt;

    Product({
        required this.id,
        required this.name,
        required this.label,
        required this.description,
        required this.unitPrice,
        required this.images,
        required this.stock,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        label: json["label"],
        description: json["description"],
        unitPrice: json["unitPrice"],
        images: List<String>.from(json["images"].map((x) => x)),
        stock: Stock.fromJson(json["stock"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "label": label,
        "description": description,
        "unitPrice": unitPrice,
        "images": List<dynamic>.from(images.map((x) => x)),
        "stock": stock.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Stock {
    int id;
    String name;
    int quantity;
    DateTime createdAt;
    DateTime updatedAt;

    Stock({
        required this.id,
        required this.name,
        required this.quantity,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
