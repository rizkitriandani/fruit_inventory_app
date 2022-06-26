import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/utils/logger.dart';
import '../../../shared/views/loading_view.dart';
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
        actions: [
          IconButton(
              onPressed: () => authController.logout(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 300,
                child: controller.isLoading.value
                    ? const LoadingView()
                    : controller.isError.value
                        ? Center(child: Text("Failed to fetch data"))
                        : ListView.separated(
                            itemCount:
                                controller.fruitsResponse?.fruits?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  switch (controller
                                      .fruitsResponse!.fruits![index].name!) {
                                    case 'apple':
                                      controller.selectedImage(controller
                                          .fruitsResponse!
                                          .imagesReferences!
                                          .apple);
                                      break;
                                    case 'manggo':
                                      controller.selectedImage(controller
                                          .fruitsResponse!
                                          .imagesReferences!
                                          .manggo);
                                      break;
                                    case 'banana':
                                      controller.selectedImage(controller
                                          .fruitsResponse!
                                          .imagesReferences!
                                          .banana);
                                      break;
                                    case 'avocado':
                                      controller.selectedImage(controller
                                          .fruitsResponse!
                                          .imagesReferences!
                                          .avocado);
                                      break;
                                    case 'melon':
                                      controller.selectedImage(controller
                                          .fruitsResponse!
                                          .imagesReferences!
                                          .melon);
                                      break;
                                    default:
                                      logger.d("No image");
                                      controller.selectedImage("");
                                  }

                                  logger.d(
                                      "selectedImage => ${controller.selectedImage.value}");
                                  controller.isShowingImage(true);
                                },
                                title: Text(controller
                                    .fruitsResponse!.fruits![index].name!),
                                trailing: Text(controller
                                    .fruitsResponse!.fruits![index].price
                                    .toString()),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(color: Colors.grey),
                          ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => controller.isShowingImage.value
                ? controller.selectedImage.value.isNotEmpty
                    ? Image.network(
                        controller.selectedImage.value,
                        height: 100,
                      )
                    : const Text("Image is not available")
                : const Text("No Fruit is selected")),
            const SizedBox(
              height: 20,
            ),
            Obx(() => ElevatedButton(
                onPressed: controller.isError.value
                    ? null
                    : () => controller.findMostDuplicates(),
                child: const Text("Fruit with the most quantities")))
          ],
        ),
      ),
    );
  }
}
