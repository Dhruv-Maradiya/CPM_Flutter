import 'package:cpm/preference/shared_preference.dart';
import 'package:cpm/views/sign_in_as_student/providers/sign_in_as_student_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInAsStudentController extends GetxController {
  RxBool isObscure = true.obs;
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
      final data = (await SignInAsStudentProvider().signInAsFaculty({
        "enrollmentNo": enrollmentNo.text,
        "password": password.text,
      }, context))!
          .data;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Successfully signed in"),
      ));
      SharedPreferencesClass.addSharePreference(
          data.userId, UserType.faculty, data.token);
    } catch (e) {}
  }
}
