import 'package:cpm/preference/shared_preference.dart';
import 'package:cpm/views/create_student_account/providers/create_student_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CreateStudentAccountController extends GetxController {
  RxBool isObscure = true.obs;
  final TextEditingController enrollmentNo = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController sem = TextEditingController();
  final TextEditingController branch = TextEditingController();

  void createStudentAccount(BuildContext context) async {
    try {
      final data = (await CreateStudentProvider().createStudent({
        "enrollmentNo": enrollmentNo.text,
        "name": name.text,
        "email": email.text,
        "password": password.text,
        "semester": int.parse(sem.text),
        "number": phone.text,
        "branchId": int.parse(branch.text),
      }, context))
          ?.data;
      if (data != null) {
        SharedPreferencesClass.addSharePreference(
            data.student.id, UserType.student, data.token);
      }
    } catch (e) {}
  }
}
