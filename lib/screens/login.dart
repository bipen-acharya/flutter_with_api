import 'package:class_demo_project/controller/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Login extends StatelessWidget {
  Login({super.key});


  var _key = GlobalKey<FormState>();

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayWidget: const Center(
          child: CupertinoActivityIndicator(
        color: Colors.white,
        radius: 25,
      )),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Invalid name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter Your Username'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Invalid passsword";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Your Password'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        context.loaderOverlay.show();
                        await controller.loginUser(
                          email: controller.emailController.text,
                          password: controller.passwordController.text,
                        );
                        context.loaderOverlay.hide();
                      }
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
