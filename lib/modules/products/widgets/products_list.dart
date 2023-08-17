import 'package:flutter/material.dart';
import 'package:sweet_smash_app/modules/products/models/get_all_products_response_model.dart';
import 'package:sweet_smash_app/modules/products/widgets/product_item.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;
  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return ProductItem(product: product);
      },
    );
  }
}
