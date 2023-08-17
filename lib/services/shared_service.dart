import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/material.dart';
import 'package:sweet_smash_app/modules/auth/models/login_response_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    return await APICacheManager().isAPICacheKeyExist('login_details');
  }

  static Future<LoginResponseModel?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData('login_details');

      return loginResponseJson(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: 'login_details',
      syncData: jsonEncode(model.toJson()),
    );

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache('login_details');
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }
}
