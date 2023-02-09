import 'package:cpm/rest/model/base_model.dart';
import 'package:cpm/rest/rest_client.dart';
import 'package:cpm/rest/rest_constants.dart';
import 'package:cpm/views/create_student_account/models/get_branches_model.dart'
    as GetBranchesModel;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateStudentAccountController extends GetxController {
  var branches = <GetBranchesModel.Datum>[].obs;

  RxBool isObscure = true.obs;
  RxBool isBranchLoading = true.obs;

  int? selectedBranch;

  final TextEditingController enrollmentNo = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController sem = TextEditingController();

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    getBranches();
    super.onInit();
  }

  void getBranches() async {
    ApiRequest request = ApiRequest(url: RestConstants.branchFindMany);
    isBranchLoading.value = true;
    ApiResponseModel response = await request.get();

    if (response.success) {
      var data = GetBranchesModel.GetBranchesModel.fromJson(response.data).data;
      branches.assignAll(data);
      isBranchLoading.value = false;
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);
      isBranchLoading.value = false;

      Get.snackbar(apiErrorModel.message, '');

      return null;
    }
  }

  void submit() async {
    ApiRequest request = ApiRequest(url: RestConstants.studentSignUp, data: {
      "enrollmentNo": enrollmentNo.text,
      "name": name.text,
      "password": password.text,
      "semester": int.parse(sem.text),
      "branchId": selectedBranch,
      "email": email.text,
      "number": phone.text,
    });
    isBranchLoading.value = true;
    ApiResponseModel response = await request.post();

    if (response.success) {
      Get.snackbar("Success", '');
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);
      isBranchLoading.value = false;

      Get.snackbar(apiErrorModel.message, '');

      return null;
    }
  }
}
