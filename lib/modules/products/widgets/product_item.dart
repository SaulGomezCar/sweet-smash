import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweet_smash_app/modules/products/models/get_all_products_response_model.dart';
import 'package:sweet_smash_app/modules/products/state/cart_state.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);

    var totalItemsInCart = cartState.findProductInCart(product.id)?.quantity;

    return ListTile(
      leading: Image.network(product.images[0]),
      trailing: Text(totalItemsInCart != null ? "x$totalItemsInCart" : ""),
      title: Text(product.label),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.description),
          const SizedBox(height: 3),
          Text("Precio: \$${product.unitPrice}"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              cartState.addProduct(product, 1);
            },
            child: const Text("Agregar al carrito"),
          )
        ],
      ),
    );
  }
}
