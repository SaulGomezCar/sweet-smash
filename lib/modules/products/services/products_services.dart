import 'package:http/http.dart' as http;
import 'package:sweet_smash_app/config.dart';
import 'package:sweet_smash_app/modules/auth/models/login_response_model.dart';
import 'package:sweet_smash_app/modules/products/models/get_all_products_response_model.dart';
import 'package:sweet_smash_app/modules/products/models/get_product_by_id_response_model.dart';
import 'package:sweet_smash_app/services/shared_service.dart';

class ProductsServices {
  static final http.Client _client = http.Client();

  static Future<List<Product>> getAllProducts() async {
    LoginResponseModel? loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer ${loginDetails!.token}',
    };

    Uri url = Uri.http(Config.apiURL, "/api/products");

    var response = await _client.get(url, headers: requestHeaders);

    return getAllProductsResponseModelFromJson(response.body).data;
  }

  static Future<Product> getProductById(int productId) async {
    LoginResponseModel? loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer ${loginDetails!.token}',
    };

    Uri url = Uri.http(Config.apiURL, "/api/products/$productId");

    var response = await _client.get(url, headers: requestHeaders);

    return getProductByIdResponseModelFromJson(response.body).data;
  }
}
