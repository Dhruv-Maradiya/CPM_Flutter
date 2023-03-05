import 'package:get/route_manager.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/project_operation/models/backend_technologies.dart';
import 'package:projectify/views/project_operation/models/database_technologies.dart';
import 'package:projectify/views/project_operation/models/frontend_technologies.dart';
import 'package:projectify/views/project_operation/models/categories.dart'
    as categories_model;
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

  Future<FrontendTechnologies?> fetchFrontendTechnologies() async {
    ApiRequest request =
        ApiRequest(url: RestConstants.fetchFrontendTechnologies);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return FrontendTechnologies.fromJson(response.data);
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

  Future<BackendTechnologies?> fetchBackendTechnologies() async {
    ApiRequest request =
        ApiRequest(url: RestConstants.fetchBackendTechnologies);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return BackendTechnologies.fromJson(response.data);
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

  Future<DatabaseTechnologies?> fetchDatabaseTechnologies() async {
    ApiRequest request =
        ApiRequest(url: RestConstants.fetchDatabaseTechnologies);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return DatabaseTechnologies.fromJson(response.data);
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

  Future<categories_model.Categories?> fetchCategories() async {
    ApiRequest request = ApiRequest(url: RestConstants.fetchCategories);

    ApiResponseModel response = await request.get();

    if (response.success) {
      return categories_model.Categories.fromJson(response.data);
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
    }
    return null;
  }
}
