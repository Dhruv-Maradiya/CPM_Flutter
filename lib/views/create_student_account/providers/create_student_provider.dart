import 'package:get/route_manager.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/create_student_account/models/create_student_model.dart';
import 'package:projectify/views/create_student_account/models/get_branches_model.dart'
    as getBranchesModel;
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

  Future<List<getBranchesModel.Branch>?>? getBranches() async {
    ApiRequest request = ApiRequest(url: RestConstants.branchFindMany);
    ApiResponseModel response = await request.get();

    if (response.success) {
      var data = getBranchesModel.GetBranchesModel.fromJson(response.data).data;
      return data.branches;
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      return null;
    }
  }
}
