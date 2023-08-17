import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweet_smash_app/modules/products/models/get_all_products_response_model.dart';
import 'package:sweet_smash_app/modules/products/state/cart_state.dart';

class ProductInCartItem extends StatelessWidget {
  const ProductInCartItem({
    super.key,
    required this.product,
    required this.productInCart,
  });

  final Product product;
  final ProductInCart productInCart;

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);

    return ListTile(
      leading: Image.network(product.images[0]),
      title: Text(product.label),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.description),
          const SizedBox(height: 3),
          Text("Precio: \$${product.unitPrice}"),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (productInCart.quantity > 1) {
                    cartState.addProduct(product, -1);
                  } else {
                    cartState.removeProduct(productInCart.productId);
                  }
                },
                icon: const Icon(Icons.remove),
              ),
              Text("${productInCart.quantity}"),
              IconButton(
                onPressed: () => cartState.addProduct(product, 1),
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
