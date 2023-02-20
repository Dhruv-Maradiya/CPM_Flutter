import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/create_student_account/models/create_student_model.dart';
import 'package:projectify/views/create_student_account/models/get_branches_model.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

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
    return null;
  }

  Future<List<Datum>?> getBranches() async {
    ApiRequest request = ApiRequest(url: RestConstants.branchFindMany);
    ApiResponseModel response = await request.get();

    if (response.success) {
      var data = GetBranchesModel.fromJson(response.data).data;
      return data;
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      return null;
    }
  }
}
