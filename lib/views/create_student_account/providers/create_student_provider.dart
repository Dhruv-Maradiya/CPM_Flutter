import 'package:cpm/rest/model/base_model.dart';
import 'package:cpm/rest/rest_client.dart';
import 'package:cpm/rest/rest_constants.dart';
import 'package:cpm/views/create_student_account/models/create_student_model.dart';
import 'package:flutter/material.dart';

class CreateStudentProvider {
  Future<StudentCreateModel?> createStudent(data, BuildContext context) async {
    ApiRequest request =
        ApiRequest(url: RestConstants.studentSignUp, data: data);
    ApiResponseModel response = await request.post();
    if (response.success) {
      return StudentCreateModel.fromJson(response.data);
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiErrorModel.message),
      ));
    }
  }
}
