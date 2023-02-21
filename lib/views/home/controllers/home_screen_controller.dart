import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/home/providers/home_screen_provider.dart';

class HomeScreenController extends GetxController {
  RxBool isNotifications = false.obs;

  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;
  HomeScreenModel? homeScreenModel;

  @override
  void onInit() async {
    isLoading.value = true;
    var data = await HomeScreenProvider().fetch(null);
    isLoading.value = false;
    isNotifications.value = data?.data.isUnreadNotifications ?? false;
    homeScreenModel = data;
    super.onInit();
  }
}
