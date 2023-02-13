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
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiErrorModel.message),
      ));

      return null;
    }
  }
}
