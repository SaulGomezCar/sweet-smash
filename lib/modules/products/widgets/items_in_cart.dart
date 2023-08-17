import 'package:flutter/material.dart';
import 'package:sweet_smash_app/modules/products/models/get_all_products_response_model.dart';
import 'package:sweet_smash_app/modules/products/services/products_services.dart';
import 'package:sweet_smash_app/modules/products/state/cart_state.dart';
import 'package:sweet_smash_app/modules/products/widgets/product_in_cart_item.dart';

class ItemsInCart extends StatelessWidget {
  final List<ProductInCart> productsInCart;

  const ItemsInCart({
    super.key,
    required this.productsInCart,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productsInCart.length,
      itemBuilder: (context, index) {
        final productInCart = productsInCart[index];

        return FutureBuilder(
            future: ProductsServices.getProductById(productInCart.productId),
            builder: (BuildContext context, AsyncSnapshot<Product> model) {
              if (model.hasData) {
                final product = model.data!;
                return ProductInCartItem(
                  product: product,
                  productInCart: productInCart,
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            });
      },
    );
  }
}
