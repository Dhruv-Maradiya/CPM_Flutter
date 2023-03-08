import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/create_task/models/group_member_model.dart';

class CreateTaskProvider {
  Future<GroupDetails?> fetchGroupDetails(dynamic data) async {
    ApiRequest request =
        ApiRequest(url: RestConstants.fetchGroup, queryParameters: data);
    ApiResponseModel response = await request.get();
    if (response.success) {
      return GroupDetails.fromJson(response.data);
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(apiErrorModel.name, apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor);
    }
    return null;
  }

  Future<bool> createTask(dynamic data) async {
    ApiRequest request =
        ApiRequest(url: RestConstants.projectTasksCreate, data: data);
    ApiResponseModel response = await request.post();
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
    }
    return false;
  }
}
