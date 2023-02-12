import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isObscure = true.obs;
}
