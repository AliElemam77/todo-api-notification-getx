import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/helpers/cache_helper.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (CacheHelper.getData(key: 'token') != null) {
      return const RouteSettings(name: '/home');
    }
    return null;
  }
}
