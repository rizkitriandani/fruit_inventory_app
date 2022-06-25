import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/shared/utils/logger.dart';
import 'app/shared/views/loading_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authController.streamAuthStatus,
        builder: (context, snapshot) {
          logger.d(snapshot);
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Fruit Inventory App",
              initialRoute: snapshot.data == null ? Routes.AUTH : Routes.HOME,
              getPages: AppPages.routes,
            );
          }
          return const LoadingView();
        });
  }
}
