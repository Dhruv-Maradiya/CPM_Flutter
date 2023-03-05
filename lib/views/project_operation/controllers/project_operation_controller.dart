import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/project_operation/models/backend_technologies.dart';
import 'package:projectify/views/project_operation/models/database_technologies.dart';
import 'package:projectify/views/project_operation/models/frontend_technologies.dart';
import 'package:projectify/views/project_operation/models/categories.dart'
    as categories_model;
import 'package:projectify/views/project_operation/models/project_operation_tasks.dart';
import 'package:projectify/views/project_operation/providers/project_operation_provider.dart';

class ProjectOperationController extends GetxController {
  RxBool isTasksLoading = false.obs;
  RxBool isTasksSuccess = false.obs;
  Rx<ProjectOperationTasksModel?> tasks = null.obs;
  RxInt totalTasks = 0.obs;
  RxBool hasMoreTasks = false.obs;

  // Project Tab
  RxBool isProjectLoading = false.obs;
  final projectFormKey = GlobalKey<FormState>();
  var images = <File>[].obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var frontendTechnologies = <FrontendTechnology>[].obs;
  var backendTechnologies = <BackendTechnology>[].obs;
  var databaseTechnologies = <DatabaseTechnology>[].obs;
  var categories = <categories_model.Category>[].obs;

  RxString selectedCategory = "".obs;
  RxString selectedFrontendTechnology = "".obs;
  RxString selectedBackendTechnology = "".obs;
  RxString selectedDatabaseTechnology = "".obs;

  int currentSlide = 0;

  @override
  void onInit() {
    super.onInit();

    var data = Get.arguments;
    final Project project = data['project'];

    fetchTasks(projectId: project.id);
    fetchTechnologies();
  }

  fetchTasks({
    required int projectId,
  }) async {
    try {
      isTasksLoading.value = true;
      var data = await ProjectOperationProvider().fetchTasks({
        "projectId": projectId,
        "take": 10,
        "skip": 0,
      });
      if (data != null) {
        tasks = data.obs;
        totalTasks.value = data.data.tasks.length;
      }
      isTasksSuccess.value = true;
      isTasksLoading.value = false;
      hasMoreTasks.value = (tasks.value?.data.count ?? 0) >
          (tasks.value?.data.tasks.length ?? 0);
    } catch (e) {
      isTasksLoading.value = false;
      isTasksSuccess.value = false;
    }
  }

  loadMoreTasks({
    required int projectId,
  }) async {
    int take = 10;
    int skip = tasks.value?.data.tasks.length ?? 0;
    var data = await ProjectOperationProvider().fetchTasks({
      "projectId": projectId,
      "take": take,
      "skip": skip,
    });
    if (data != null) {
      if (tasks.value?.data.tasks.isNotEmpty == true) {
        tasks.value?.data.tasks.addAll(data.data.tasks);
        totalTasks.value = totalTasks.value + data.data.tasks.length;
      } else {
        tasks = data.obs;
        totalTasks.value = data.data.tasks.length;
      }
      hasMoreTasks.value = (tasks.value?.data.count ?? 0) >
          (tasks.value?.data.tasks.length ?? 0);
    }
  }

  fetchTechnologies() {
    fetchFrontendTechnologies();
    fetchBackendTechnologies();
    fetchDatabaseTechnologies();
    fetchCategories();
  }

  fetchFrontendTechnologies() async {
    var data = await ProjectOperationProvider().fetchFrontendTechnologies();
    if (data != null) {
      frontendTechnologies.value = data.data.frontendTechnologies;
    }
  }

  fetchBackendTechnologies() async {
    var data = await ProjectOperationProvider().fetchBackendTechnologies();
    if (data != null) {
      backendTechnologies.value = data.data.backendTechnologies;
    }
  }

  fetchDatabaseTechnologies() async {
    var data = await ProjectOperationProvider().fetchDatabaseTechnologies();
    if (data != null) {
      databaseTechnologies.value = data.data.databaseTechnologies;
    }
  }

  fetchCategories() async {
    var data = await ProjectOperationProvider().fetchCategories();
    if (data != null) {
      categories.value = data.data.categories;
    }
  }

  addImage(File image) {
    images.add(image);
  }

  removeImage() {
    if (currentSlide > images.length - 1) {
      images.removeAt(images.length - 1);
    } else {
      images.removeAt(currentSlide);
    }
  }
}
