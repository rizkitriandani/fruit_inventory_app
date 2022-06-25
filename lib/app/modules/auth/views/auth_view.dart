import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/views/loading_view.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit Inventory App'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? const LoadingView()
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hai, silahkan login terlebih dahulu.",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () => controller.anonymousLogin(),
                    child: const Text("Login")),
              ],
            ))),
    );
  }
}
