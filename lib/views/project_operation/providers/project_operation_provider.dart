import 'package:get/route_manager.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/project_operation/models/project_operation_tasks.dart';

class ProjectOperationProvider {
  Future<ProjectOperationTasksModel?> fetchTasks(dynamic params) async {
    ApiRequest request = ApiRequest(
        url: RestConstants.projectTasksFetch, queryParameters: params);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return ProjectOperationTasksModel.fromJson(response.data);
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
