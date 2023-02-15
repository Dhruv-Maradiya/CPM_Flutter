import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/home/home_screen.dart';
import 'package:projectify/views/sign_in_as_student/providers/sign_in_as_student_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInAsStudentController extends GetxController {
  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;
  final TextEditingController enrollmentNo = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    enrollmentNo.dispose();
    password.dispose();
    super.dispose();
  }

  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      isLoading.value = true;
      final data = (await SignInAsStudentProvider().signInAsFaculty({
        "enrollmentNo": enrollmentNo.text,
        "password": password.text,
      }, context))!
          .data;
      isLoading.value = false;
      SharedPreferencesClass.addSharePreference(
          data.userId, UserType.student, data.token);
      Get.offAll(const HomeScreen());
    } catch (e) {}
  }
}
