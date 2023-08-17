import 'package:flutter/material.dart';

class CheckoutState extends ChangeNotifier {
  int? paymentTypeId;
  int? userId;

  void setPaymentTypeId(int paymentTypeId) {
    this.paymentTypeId = paymentTypeId;
    notifyListeners();
  }

  void setUserId(int userId) {
    this.userId = userId;
    notifyListeners();
  }
}
