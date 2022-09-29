import 'dart:convert';

import 'package:class_demo_project/model/user_detail_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/api_service.dart';

class UserDetailsController extends GetxController {
  var users = <UserDetails>[].obs;
  getUserDetails() async {
    try {
      http.Response response = await AuthApiService().getUserDetails();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var listOfDetails = UserDetails.userDetailsFromJson(response.body);
        users.add(listOfDetails);
        print(response.body);
        print(users);
      } else {
        var responseBody = jsonDecode(response.body);
        print(response.body);
        throw Exception("Invalid");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString().replaceAll("Exception:", ""));
    }
  }
}
