import 'package:get/route_manager.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/groups/models/create_project_model.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/project_operation/models/project_operation_tasks.dart';
import 'package:projectify/views/project_operation/models/project_model.dart';
import 'package:projectify/views/project_operation/models/technology.dart';
import 'package:projectify/views/project_operation/models/invite_students_model.dart'
    as inviteStudentsModel;
import 'package:projectify/views/project_operation/models/categories_modal.dart'
    as categories_modal;

class ProjectOperationProvider {
  Future<Project?> updateProject({required data}) async {
    ApiRequest request =
        ApiRequest(url: RestConstants.createProject, data: data);
    ApiResponseModel response = await request.put();

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
  }

  Future<ProjectOperationProjectModel?> fetchProject(dynamic params) async {
    ApiRequest request =
        ApiRequest(url: RestConstants.findOneProject, queryParameters: params);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return ProjectOperationProjectModel.fromJson(response.data);
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(apiErrorModel.name, apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor);

      return null;
    }
  }

  Future<ProjectOperationTasksModel?> fetchTasks(dynamic params) async {
    ApiRequest request = ApiRequest(
        url: RestConstants.projectTasksFetch, queryParameters: params);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return ProjectOperationTasksModel.fromJson(response.data);
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(apiErrorModel.name, apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor);

      return null;
    }
  }

  Future<Technologies?> fetchFrontendTechnologies() async {
    ApiRequest request =
        ApiRequest(url: RestConstants.fetchFrontendTechnologies);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return Technologies.fromJson(response.data, "frontendTechnologies");
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(apiErrorModel.name, apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor);

      return null;
    }
  }

  Future<Technologies?> fetchBackendTechnologies() async {
    ApiRequest request =
        ApiRequest(url: RestConstants.fetchBackendTechnologies);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return Technologies.fromJson(response.data, "backendTechnologies");
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(apiErrorModel.name, apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor);

      return null;
    }
  }

  Future<Technologies?> fetchDatabaseTechnologies() async {
    ApiRequest request =
        ApiRequest(url: RestConstants.fetchDatabaseTechnologies);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return Technologies.fromJson(response.data, "databaseTechnologies");
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(apiErrorModel.name, apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor);

      return null;
    }
  }

  Future<categories_modal.Categories?> fetchCategories() async {
    ApiRequest request = ApiRequest(url: RestConstants.fetchCategories);

    ApiResponseModel response = await request.get();

    if (response.success) {
      return categories_modal.Categories.fromJson(response.data);
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

  Future<inviteStudentsModel.Data?> fetchInviteStudents(dynamic params) async {
    ApiRequest request = ApiRequest(
        url: RestConstants.fetchInviteStudents, queryParameters: params);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return inviteStudentsModel.InviteStudentsModel.fromJson(response.data)
          .data;
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(
        apiErrorModel.name,
        apiErrorModel.message,
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
      );
    }
    return null;
  }

  Future<bool> invite(dynamic data) async {
    ApiRequest request = ApiRequest(url: RestConstants.invite, data: data);
    ApiResponseModel response = await request.post();

    if (response.success) {
      return true;
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(
        apiErrorModel.name,
        apiErrorModel.message,
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
      );
    }
    return false;
  }
}
