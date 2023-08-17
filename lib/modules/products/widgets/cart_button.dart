import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweet_smash_app/modules/products/state/cart_state.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.itemCount,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {

    final cartState = Provider.of<CartState>(context);

    return GestureDetector(
      onLongPress: () => cartState.cleanCart(),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
        icon: Stack(
          children: [
            const Icon(Icons.shopping_cart),
            if (itemCount > 0)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    itemCount.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
