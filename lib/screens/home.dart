import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/user_detail_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  UserDetailsController controller = Get.put(UserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: ListTile(
                  title: Text("data"),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(controller.getUserDetails());
                // AuthController.logOutUser();
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
