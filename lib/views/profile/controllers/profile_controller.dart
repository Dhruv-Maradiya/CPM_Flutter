import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:projectify/preference/shared_preference.dart';

class ProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isObscure = true.obs;

  Rx<UserType> type = UserType.none.obs;

  @override
  void onInit() async {
    super.onInit();
    var data = await SharedPreferencesClass.getSharePreference();
    if (data != null) {
      type.value = data.userType;
    }
  }
}
