import 'package:class_demo_project/controller/register_user_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  Register({super.key});

  final _key = GlobalKey<FormState>();
  UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
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
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Inalid username";
                      }
                      return null;
                    },
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter Your Username'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Inalid Email";
                      }
                      return null;
                    },
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter Your Email'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.length < 10) {
                        return "Inalid phone number";
                      }
                      return null;
                    },
                    controller: controller.phoneController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                        hintText: 'Enter Your Phone number'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Ivalid password";
                      }
                      return null;
                    },
                    controller: controller.passwordController,
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
                        await controller.registerUser(
                            name: controller.nameController.text,
                            phone: controller.phoneController.text,
                            email: controller.emailController.text,
                            password: controller.passwordController.text);
                        context.loaderOverlay.hide();
                      }
                    },
                    child: const Text("Register"),
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
