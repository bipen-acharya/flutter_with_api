import 'package:class_demo_project/const/apis.dart';
import 'package:class_demo_project/model/login_model.dart';
import 'package:class_demo_project/model/registerUser_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthApiService {
  Future register(RegisterUser user) async {
    try {
      print(RegisterUser.registerUserToJson(user));
      var url = Uri.parse(Apis.register);
      http.Response response = await http.post(
        url,
        body: RegisterUser.registerUserToJson(user),
        headers: {"Content-Type": "application/json"},
      );
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future login(LoginUser user) async {
    try {
      var url = Uri.parse(Apis.login);
      http.Response response = await http.post(url,
          body: LoginUser.loginUserToJson(user),
          headers: {"Content-Type": "application/json"});
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getUserDetails() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print(token);
    try {
      var url = Uri.parse(Apis.userDetails);
      http.Response response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
