import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/create_student_account/models/get_branches_model.dart'
    as GetBranchesModel;
import 'package:projectify/views/create_student_account/providers/create_student_provider.dart';
import 'package:projectify/views/home/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/routes.dart';

class CreateStudentAccountController extends GetxController {
  var branches = <GetBranchesModel.Branch>[].obs;

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
  RxBool isTermsAndConditionAccepted = false.obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    getBranches();
  }

  void getBranches() async {
    isBranchLoading.value = true;
    var response = await CreateStudentProvider().getBranches();
    if (response != null) {
      branches.assignAll(response);
    } else {}
    isBranchLoading.value = false;
  }

  void submit(BuildContext context) async {
    try {
      isLoading.value = true;

      var data = await CreateStudentProvider().createStudent({
        "enrollmentNo": enrollmentNo.text,
        "name": name.text,
        "password": password.text,
        "semester": int.parse(sem.text),
        "branchId": selectedBranch,
        "email": email.text,
        "number": phone.text,
      }, context);
      isLoading.value = false;

      if (data != null) {
        var res = data.data;
        SharedPreferencesClass.addSharePreference(
            res.student.id, UserType.faculty, res.token);
        Get.offAllNamed(Routes.home)
            ?.then((value) => Get.delete<HomeScreenController>());
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }
}
