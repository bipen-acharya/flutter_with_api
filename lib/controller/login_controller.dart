import 'package:class_demo_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../model/login.dart';
import '../services/api_service.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  loginUser({
    required String email,
    required String password,
  }) async {
    try {
      LoginUser user = LoginUser(
        email: email,
        password: password,
      );
      http.Response response = await AuthApiService().login(user);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Get.to(const HomePage());
      } else {
        throw Exception("Invalid");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
