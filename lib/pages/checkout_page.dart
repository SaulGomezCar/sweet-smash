import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweet_smash_app/modules/auth/models/user_profile_response_model.dart';
import 'package:sweet_smash_app/modules/auth/services/auth_service.dart';
import 'package:sweet_smash_app/modules/checkout/models/order_request_model.dart';
import 'package:sweet_smash_app/modules/checkout/services/checkout_service.dart';
import 'package:sweet_smash_app/modules/checkout/state/checkout_state.dart';
import 'package:sweet_smash_app/modules/checkout/widgets/payment_details.dart';
import 'package:sweet_smash_app/modules/products/models/get_all_products_response_model.dart';
import 'package:sweet_smash_app/modules/products/services/products_services.dart';
import 'package:sweet_smash_app/modules/products/state/cart_state.dart';
import 'package:sweet_smash_app/services/shared_service.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartState>(context);
    final checkoutState = Provider.of<CheckoutState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Caja"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => SharedService.logout(context),
            icon: const Icon(Icons.logout_rounded),
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          TotalToPay(cartState: cartState),

          // Métodos de pago
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Selecciona la forma de pago",
              style: TextStyle(fontSize: 24),
            ),
          ),
          const PaymentDetails(),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () async {
                final UserProfile userProfile =
                    await AuthService.getUserProfile();
                final request = OrderRequestModel(
                  userId: userProfile.id,
                  paymentTypeId: checkoutState.paymentTypeId!,
                  productsInOrder: cartState.productsInCart,
                );

                CheckoutService.requestOrder(request);

                if (context.mounted) Navigator.pushNamed(context, "/success");
              },
              child: const Text("Pagar"),
            ),
          )
        ],
      ),
    );
  }
}

class TotalToPay extends StatelessWidget {
  const TotalToPay({
    super.key,
    required this.cartState,
  });

  final CartState cartState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: FutureBuilder(
          future: ProductsServices.getAllProducts(),
          builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
            if (model.hasData) {
              return Text(
                "Total a pagar: \$${cartState.getTotalAmount(model.data!)}",
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
