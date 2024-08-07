import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/network/api_service.dart';
import 'package:todo_workshop/features/auth/data/models/login_request_body.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ApiService apiService = ApiService();
  void login() async {
    LoginRequestBody loginRequestBody = LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    );
    try {
      await apiService.login(loginRequestBody.email, loginRequestBody.password);
      Get.offAllNamed('/home');
    } catch (e) {
      print('Error: $e');
    }
  }
}
