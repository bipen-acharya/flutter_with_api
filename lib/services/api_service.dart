import 'package:class_demo_project/const/apis.dart';
import 'package:class_demo_project/model/login.dart';
import 'package:class_demo_project/model/register.dart';
import 'package:http/http.dart' as http;

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
}
