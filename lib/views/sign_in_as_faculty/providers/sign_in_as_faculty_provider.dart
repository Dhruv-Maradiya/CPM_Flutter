import 'package:get/route_manager.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/sign_in_as_faculty/models/sign_in_as_faculty_model.dart';
import 'package:flutter/material.dart';

class SignInAsFacultyProvider {
  Future<FacultySignInModel?> signInAsFaculty(
      data, BuildContext context) async {
    ApiRequest request =
        ApiRequest(url: RestConstants.facultySignIn, data: data);
    ApiResponseModel response = await request.post();

    if (response.success) {
      return FacultySignInModel.fromJson(response.data);
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
