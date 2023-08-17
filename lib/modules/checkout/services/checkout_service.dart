import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sweet_smash_app/config.dart';
import 'package:sweet_smash_app/modules/auth/models/login_response_model.dart';
import 'package:sweet_smash_app/modules/checkout/models/get_all_payment_details_response_model.dart';
import 'package:sweet_smash_app/modules/checkout/models/order_request_model.dart';
import 'package:sweet_smash_app/services/shared_service.dart';

class CheckoutService {
  static final http.Client _client = http.Client();

  static Future<List<PaymentDetail>> getAllProducts() async {
    LoginResponseModel? loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer ${loginDetails!.token}',
    };

    Uri url = Uri.http(Config.apiURL, "/api/payment-types");

    var response = await _client.get(url, headers: requestHeaders);

    return getAllPaymentDetailsResponseModelFromJson(response.body).data;
  }

  static Future<void> requestOrder(OrderRequestModel request) async {
    LoginResponseModel? loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer ${loginDetails!.token}',
    };

    Uri url = Uri.http(Config.apiURL, "/api/orders/request");

    await _client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(request.toJson()),
    );
  }
}
