import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/create_student_account/models/get_branches_model.dart'
    as GetBranchesModel;
import 'package:projectify/views/create_student_account/providers/create_student_provider.dart';
import 'package:projectify/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateStudentAccountController extends GetxController {
  var branches = <GetBranchesModel.Datum>[].obs;

  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;
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
    isBranchLoading.value = true;
    var response = await CreateStudentProvider().getBranches();
    isBranchLoading.value = false;
    if (response != null) {
      branches.assignAll(response);
    } else {}
  }

  void submit(BuildContext context) async {
    isLoading.value = true;

    var data = (await CreateStudentProvider().createStudent({
      "enrollmentNo": enrollmentNo.text,
      "name": name.text,
      "password": password.text,
      "semester": int.parse(sem.text),
      "branchId": selectedBranch,
      "email": email.text,
      "number": phone.text,
    }, context))!
        .data;
    isLoading.value = false;
    SharedPreferencesClass.addSharePreference(
        data.student.id, UserType.faculty, data.token);
    Get.offAll(const HomeScreen());
  }
}
