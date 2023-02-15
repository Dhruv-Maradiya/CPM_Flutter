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
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiErrorModel.message),
      ));

      return null;
    }
  }
}
