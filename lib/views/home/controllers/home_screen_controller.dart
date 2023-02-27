import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/home/providers/home_screen_provider.dart';

class HomeScreenController extends GetxController {
  RxBool isNotifications = false.obs;

  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;
  HomeScreenModel? homeScreenModel;

  RxInt selectedCategoryIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    isLoading.value = true;
    var data = await HomeScreenProvider().fetch(null);
    isLoading.value = false;

    if (data != null) {
      homeScreenModel = data;
      isSuccess.value = true;
    } else {
      isSuccess.value = false;
    }

    isNotifications.value = data?.data.isUnreadNotifications ?? false;
  }
}
