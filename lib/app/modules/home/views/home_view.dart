import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authController = Get.find<AuthController>();
  HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit Inventory'),
        centerTitle: true,
        actions: [IconButton(onPressed: () => authController.logout(), icon: const Icon(Icons.logout))],
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
