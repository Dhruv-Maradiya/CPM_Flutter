import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/home/providers/home_screen_provider.dart';

class HomeScreenController extends GetxController {
  RxBool isNotifications = false.obs;

  TextEditingController searchController = TextEditingController();

  Rx<HomeScreenModel?> homeScreenModel = null.obs;

  @override
  void onInit() async {
    var data = await HomeScreenProvider().fetch(null);
    homeScreenModel.value = data;
    super.onInit();
  }
}
