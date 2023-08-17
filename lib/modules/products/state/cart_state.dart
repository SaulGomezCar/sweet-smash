// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:sweet_smash_app/modules/products/models/get_all_products_response_model.dart';

class ProductInCart {
  int quantity;
  int productId;

  ProductInCart({
    required this.quantity,
    required this.productId,
  });

  factory ProductInCart.fromJson(Map<String, dynamic> json) => ProductInCart(
        quantity: json["quantity"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "productId": productId,
      };

  @override
  String toString() {
    return "quantity: $quantity, productId: $productId";
  }
}

class CartState extends ChangeNotifier {
  List<ProductInCart> productsInCart = [];

  int get totalItems {
    return productsInCart.length;
  }

  void addProduct(Product product, int quantity) {
    final ProductInCart? existingItem = productsInCart.firstWhereOrNull(
      (element) => element.productId == product.id,
    );

    if (existingItem != null) {
      existingItem.quantity += quantity;
    } else {
      final productInCart =
          ProductInCart(quantity: quantity, productId: product.id);
      productsInCart.add(productInCart);
    }

    notifyListeners();
  }

  ProductInCart? findProductInCart(int productId) {
    return productsInCart.firstWhereOrNull(
      (element) => element.productId == productId,
    );
  }

  void removeProduct(int productId) {
    productsInCart.removeWhere((element) => element.productId == productId);
    notifyListeners();
  }

  void cleanCart() {
    productsInCart = [];
    notifyListeners();
  }

  double getTotalAmount(List<Product> products) {
    double amount = 0;
    for (var item in productsInCart) {
      Product? product =
          products.firstWhereOrNull((p) => p.id == item.productId);

      if (product != null) {
        amount += product.unitPrice * item.quantity;
      }
    }

    return amount;
  }
}
