import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweet_smash_app/modules/checkout/models/get_all_payment_details_response_model.dart';
import 'package:sweet_smash_app/modules/checkout/services/checkout_service.dart';
import 'package:sweet_smash_app/modules/checkout/state/checkout_state.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  int? selectedPaymentType;

  @override
  Widget build(BuildContext context) {
    final checkoutState = Provider.of<CheckoutState>(context);

    return FutureBuilder(
      future: CheckoutService.getAllProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<PaymentDetail>> model) {
        if (model.hasData) {
          final paymentDetails = model.data!;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: paymentDetails.length,
            itemBuilder: (context, index) {
              final paymentDetail = paymentDetails[index];
              // return Text(paymentDetail.label);
              return RadioListTile<int>(
                value: paymentDetail.id,
                groupValue: selectedPaymentType,
                title: Text(paymentDetail.label),
                onChanged: (value) {
                  setState(() {
                    selectedPaymentType = value;
                  });
                  checkoutState.setPaymentTypeId(selectedPaymentType!);
                },
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
