import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/home/controllers/home_screen_controller.dart';
import 'package:projectify/views/home/home_screen.dart';
import 'package:projectify/views/sign_in_as_faculty/providers/sign_in_as_faculty_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInAsFacultyController extends GetxController {
  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;
  final TextEditingController employeeId = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    employeeId.dispose();
    password.dispose();
    super.dispose();
  }

  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      isLoading.value = true;
      final data = (await SignInAsFacultyProvider().signInAsFaculty({
        "employeeId": employeeId.text,
        "password": password.text,
      }, context))!
          .data;
      isLoading.value = false;
      SharedPreferencesClass.addSharePreference(
          data.userId, UserType.faculty, data.token);
      Get.offAll(const HomeScreen())
          ?.then((value) => Get.delete<HomeScreenController>());
    } catch (e) {}
  }
}
