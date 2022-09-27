import 'package:class_demo_project/model/register.dart';
import 'package:class_demo_project/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  registerUser({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      RegisterUser user = RegisterUser(
        name: name,
        phone: phone,
        email: email,
        password: password,
      );
      http.Response response = await AuthApiService().register(user);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response.toString());
        Fluttertoast.showToast(
          msg: "Register Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        throw Exception("Invalid");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
