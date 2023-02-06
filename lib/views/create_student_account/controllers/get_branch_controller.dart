import 'package:cpm/rest/model/base_model.dart';
import 'package:cpm/rest/rest_client.dart';
import 'package:cpm/rest/rest_constants.dart';
import 'package:cpm/views/create_student_account/models/get_branches_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetBranch extends GetxController {
  Future<GetBranchesModel?> getBranches(BuildContext context) async {
    ApiRequest request = ApiRequest(url: RestConstants.branchFindMany);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return GetBranchesModel.fromJson(response.data);
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
