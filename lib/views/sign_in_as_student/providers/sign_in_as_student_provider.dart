import 'package:get/get.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/sign_in_as_student/models/sign_in_student_model.dart';
import 'package:flutter/material.dart';

class SignInAsStudentProvider {
  Future<StudentSignInModel?> signInAsFaculty(
      data, BuildContext context) async {
    ApiRequest request =
        ApiRequest(url: RestConstants.studentSignIn, data: data);
    ApiResponseModel response = await request.post();

    if (response.success) {
      return StudentSignInModel.fromJson(response.data);
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
