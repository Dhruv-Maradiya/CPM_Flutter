import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/home/providers/home_screen_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreenController extends GetxController {
  RxBool isNotifications = false.obs;

  TextEditingController searchController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;
  HomeScreenModel? homeScreenModel;

  RxInt selectedCategoryIndex = 0.obs;

  RxBool hasMoreProjects = false.obs;
  RxInt totalProjects = 0.obs;
  RxInt loadedProjects = 0.obs;

  @override
  void onInit() {
    super.onInit();

    fetch();
  }

  fetch() async {
    isLoading.value = true;
    var data = await HomeScreenProvider().fetch(null);
    isLoading.value = false;

    if (data != null) {
      homeScreenModel = data;
      isSuccess.value = true;
      totalProjects.value = homeScreenModel?.data.count ?? 0;
      loadedProjects.value = homeScreenModel?.data.projects.length ?? 0;
    } else {
      isSuccess.value = false;
    }

    isNotifications.value = data?.data.isUnreadNotifications ?? false;
  }

  loadMoreProjects() async {
    int skip = loadedProjects.value;
    int take = 10;
    var data = await HomeScreenProvider().fetch({
      "skip": skip,
      "take": take,
    });
    if (data != null) {
      if (homeScreenModel?.data.projects.isEmpty == true) {
        homeScreenModel?.data.projects.addAll(data.data.projects);
      } else {
        homeScreenModel = data;
      }
      totalProjects.value = homeScreenModel?.data.count ?? 0;
      loadedProjects.value = homeScreenModel?.data.projects.length ?? 0;
      hasMoreProjects.value = (homeScreenModel?.data.count ?? 0) >
          (homeScreenModel?.data.projects.length ?? 0);
    }
  }
}
