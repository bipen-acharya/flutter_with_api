import 'package:class_demo_project/screens/home.dart';
import 'package:class_demo_project/screens/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  late SharedPreferences prefs;
  @override
  void onInit() {
    super.onInit();
    authenticateUser();
  }

  getToken() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return (token);
  }

  authenticateUser() async {
    String? token = await getToken();
    if (token == null) {
      Get.offAll(Login());
    } else {
      Get.offAll(HomePage());
    }
  }


  static logOutUser() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(Login());
  }
}
