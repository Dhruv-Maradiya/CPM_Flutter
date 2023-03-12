import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/groups/models/create_project_model.dart';

class CreateProjectProvider {
  Future<Project?> createProject({required data}) async {
    try {
      ApiRequest request =
          ApiRequest(url: RestConstants.createProject, data: data);
      ApiResponseModel response = await request.post();

      if (response.success) {
        return CreateProjectModel.fromJson(response.data).data.project;
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
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
      );
    }
    return null;
  }
}
