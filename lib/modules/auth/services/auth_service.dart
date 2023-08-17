import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sweet_smash_app/config.dart';
import 'package:sweet_smash_app/modules/auth/models/login_request_model.dart';
import 'package:sweet_smash_app/modules/auth/models/login_response_model.dart';
import 'package:sweet_smash_app/modules/auth/models/register_request_model.dart';
import 'package:sweet_smash_app/modules/auth/models/register_response_model.dart';
import 'package:sweet_smash_app/modules/auth/models/user_profile_response_model.dart';
import 'package:sweet_smash_app/services/shared_service.dart';

class AuthService {
  static http.Client client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Uri url = Uri.http(Config.apiURL, Config.loginAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    }

    return false;
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Uri url = Uri.http(Config.apiURL, Config.registerAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseJson(response.body);
  }

  static Future<UserProfile> getUserProfile() async {
    LoginResponseModel? loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.token}',
    };

    Uri url = Uri.http(
      Config.apiURL,
      '${Config.userProfileAPI}/${loginDetails.userId}',
    );
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    return userProfileResponseModelFromJson(response.body).data;
  }
}
