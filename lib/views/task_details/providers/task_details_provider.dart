import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';

class TaskDetailsProvider {
  Future<bool> update(dynamic data) async {
    try {
      ApiRequest request =
          ApiRequest(url: RestConstants.tasksUpdate, data: data);
      ApiResponseModel response = await request.put();

      if (response.success) {
        return true;
      } else {
        final ApiErrorModel apiErrorModel =
            ApiErrorModel.fromJson(response.error);
        Get.snackbar(apiErrorModel.name, apiErrorModel.message,
            isDismissible: true,
            duration: const Duration(seconds: 3),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Pallets.errorColor);

        return false;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
        isDismissible: true,
        duration: const Duration(seconds: 3),
      );
      return false;
    }
  }
}
