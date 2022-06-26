import 'package:get/get.dart';

import '../../../data/models/fruits_request.dart';
import '../../../data/models/fruits_response.dart';
import '../../../shared/services/http_service.dart';
import '../../../shared/utils/logger.dart';
import 'package:dio/dio.dart' as d;

class HomeController extends GetxController {
  HttpService httpService = HttpService();
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool isShowingImage = false.obs;
  FruitsResponse? fruitsResponse;
  RxString selectedImage = "".obs;

  @override
  void onInit() async {
    logger.d("INIT HOME CONTROLLER");
    httpService.init();
    await fetchFruitsData();
    super.onInit();
  }

  Future<FruitsResponse?> fetchFruitsData() async {
    logger.d("FETCHING FRUITS DATA");
    var request = FruitsRequest(
            data: Data(imageReferences: true, referenceId: "1650165235"))
        .toJson();

    try {
      isLoading(true);
      final result = await httpService.requestPublic(
          url: "/ta/challenges/fruits", method: Method.POST, params: request);
      if (result != null) {
        if (result is d.Response) {
          logger.d("Result => ${result.data['data']}");
          fruitsResponse = FruitsResponse.fromJson(result.data['data']);
          isError(false);
        }
      }
    } catch (err) {
      isError(true);
      throw Exception(err);
    } finally {
      isLoading(false);
    }
    return fruitsResponse;
  }

  void findMostDuplicates() {
    var map = {};

    for (var x in fruitsResponse!.fruits!) {
      map[x.name] = !map.containsKey(x.name) ? (1) : (map[x.name] + 1);
    }

    logger.d(map);

    var total = 0;
    var mostFruit = "";

    map.forEach((k, v) {
      if (v > total) {
        total = v;
        mostFruit = k;
      }
    });

    logger.d(mostFruit);

    Get.defaultDialog(
      title: "Most quantities fruit",
      middleText: "$mostFruit total is $total",
      textCancel: "Close",
    );
  }
}
