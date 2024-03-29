import 'package:get/route_manager.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/profile/models/profile_faculty_model.dart';
import 'package:projectify/views/profile/models/profile_student_model.dart';

class ProfileProvider {
  Future<StudentProfileModel?> fetchStudentProfile(
      {required int studentId}) async {
    try {
      var params = {
        "id": studentId,
      };

      ApiRequest request = ApiRequest(
          url: RestConstants.studentProfile, queryParameters: params);
      ApiResponseModel response = await request.get();

      if (response.success) {
        return StudentProfileModel.fromJson(response.data);
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

  Future<FacultyProfileModel?> fetchFacultyProfile(
      {required int facultyId}) async {
    try {
      var params = {
        "id": facultyId,
      };

      ApiRequest request = ApiRequest(
          url: RestConstants.studentProfile, queryParameters: params);
      ApiResponseModel response = await request.get();

      if (response.success) {
        return FacultyProfileModel.fromJson(response.data);
      } else {
        final ApiErrorModel apiErrorModel =
            ApiErrorModel.fromJson(response.error);

        return null;
      }
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

  Future<StudentProfileModel?> updateStudentProfile(
      {required dynamic data}) async {
    try {
      ApiRequest request = ApiRequest(
        url: RestConstants.studentProfileUpdate,
        data: data,
      );
      ApiResponseModel response = await request.put();

      if (response.success) {
        return StudentProfileModel.fromJson(response.data);
      } else {
        final ApiErrorModel apiErrorModel =
            ApiErrorModel.fromJson(response.error);
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

  Future<FacultyProfileModel?> updateFacultyProfile(
      {required dynamic data}) async {
    try {
      ApiRequest request = ApiRequest(
        url: RestConstants.facultyProfileUpdate,
        data: data,
      );
      ApiResponseModel response = await request.put();

      if (response.success) {
        return FacultyProfileModel.fromJson(response.data);
      } else {
        final ApiErrorModel apiErrorModel =
            ApiErrorModel.fromJson(response.error);
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
