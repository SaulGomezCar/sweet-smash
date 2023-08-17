import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweet_smash_app/modules/products/state/cart_state.dart';
import 'package:sweet_smash_app/modules/products/widgets/items_in_cart.dart';
import 'package:sweet_smash_app/services/shared_service.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrito"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => SharedService.logout(context),
            icon: const Icon(Icons.logout_rounded),
            color: Colors.white,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, "/checkout"),
        label: const Text("Proceder al pago"),
      ),
      backgroundColor: Colors.grey[200],
      body: ItemsInCart(
        productsInCart: cartState.productsInCart,
      ),
    );
  }
}
