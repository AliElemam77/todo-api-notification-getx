import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // putDat("token", )
  static Future<bool> putData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setStringList(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences?.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> clearData() async {
    return await sharedPreferences!.clear();
  }

  static cacheToken(String token) {
    putData(key: 'token', value: token);
  }

  void cacheUser(Map<String, dynamic> user) {
    putData(key: 'user', value: json.encode(user));
  }

  // static UserModel getUser() {
  //   var user = getData(key: 'user');
  //   return UserModel.fromJson(json.decode(user.toString()));
  // }
}
