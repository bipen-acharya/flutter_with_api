import 'dart:convert';

import 'package:class_demo_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/login_model.dart';
import '../services/api_service.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late SharedPreferences prefs;

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
        prefs = await SharedPreferences.getInstance();
        var responseBody = jsonDecode(response.body);
        prefs.setString("token", responseBody["refreshToken"]);
        Get.offAll( HomePage());
        print(response.body);
      } else {
        var responseBody = jsonDecode(response.body);
        print(response.body);
        throw Exception(responseBody["message"]);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString().replaceAll("Exception:", ""));
    }
  }
}
