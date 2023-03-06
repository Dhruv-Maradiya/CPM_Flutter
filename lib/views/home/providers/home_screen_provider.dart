import 'package:get/get.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';

class HomeScreenProvider {
  Future<HomeScreenModel?> fetch(dynamic params) async {
    ApiRequest request =
        ApiRequest(url: RestConstants.homeScreen, queryParameters: params);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return HomeScreenModel.fromJson(response.data);
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(
        apiErrorModel.name,
        apiErrorModel.message,
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );

      return null;
    }
  }
}
