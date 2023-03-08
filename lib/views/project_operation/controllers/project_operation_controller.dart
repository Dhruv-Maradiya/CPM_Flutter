import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/project_operation/models/project_operation_tasks.dart';
import 'package:projectify/views/project_operation/providers/project_operation_provider.dart';
import 'package:dio/dio.dart' as dio;

class ProjectImages {
  ProjectImages({
    this.file,
    this.img,
  });

  final File? file;
  final Media? img;
}

class ProjectOperationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  RxBool isTasksLoading = false.obs;
  RxBool isTasksSuccess = false.obs;
  Rx<ProjectOperationTasksModel?> tasks = null.obs;
  RxInt totalTasks = 0.obs;
  RxBool hasMoreTasks = false.obs;

  // Project Tab
  Rx<Project?> project = null.obs;
  RxBool isProjectSuccess = false.obs;

  RxBool isProjectLoading = false.obs;
  final projectFormKey = GlobalKey<FormState>();

  var images = <ProjectImages>[].obs;
  final List<int> _removedImages = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var frontendTechnologies = <Technology>[].obs;
  var backendTechnologies = <Technology>[].obs;
  var databaseTechnologies = <Technology>[].obs;
  var categories = <Category>[].obs;

  RxString selectedCategory = "".obs;
  RxString selectedFrontendTechnology = "".obs;
  RxString selectedBackendTechnology = "".obs;
  RxString selectedDatabaseTechnology = "".obs;

  int currentSlide = 0;

  // members tab
  var members = <GroupParticipant>[].obs;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1,
    );

    var data = Get.arguments;
    final Project project = data['project'];

    fetchTasks(projectId: project.id);
    fetchTechnologies();
    fetchProject(projectId: project.id);
  }

  Future<void> updateProject() async {
    isProjectLoading.value = true;

    final imagesToUpload = images.where((e) => e.file != null).toList();

    final imagesFormData = await Future.wait(imagesToUpload.map((e) async {
      return dio.MultipartFile.fromFile(e.file?.path ?? '',
          filename: (e.file?.path ?? '').split('/').last);
    }));
    var formData = dio.FormData.fromMap({
      "files": imagesFormData,
      "id": project.value!.id,
      'name': titleController.text,
      'description': descriptionController.text,
      'frontendTechnologyId': selectedFrontendTechnology.value,
      'backendTechnologyId': selectedBackendTechnology.value,
      'databaseTechnologyId': selectedDatabaseTechnology.value,
      'categoryId': selectedCategory.value,
      ...(_removedImages.isNotEmpty
          ? {"removeImages": _removedImages.toString()}
          : {}),
    });

    try {
      var response =
          await ProjectOperationProvider().updateProject(data: formData);
      _removedImages.clear();
      isProjectLoading.value = false;
    } catch (e) {
      isProjectLoading.value = false;
    }
  }

  Future<void> fetchProject({
    required int projectId,
  }) async {
    isProjectLoading.value = true;
    isProjectSuccess.value = false;

    var data = (await ProjectOperationProvider().fetchProject({
      "id": projectId,
    }))
        ?.data;
    if (data != null) {
      project = data.obs;
      isProjectSuccess.value = true;

      titleController.text = data.name;
      descriptionController.text = data.description;

      // frontendTechnologies.value = [data.frontendTechnology];
      selectedFrontendTechnology.value = data.frontendTechnology.id.toString();

      // backendTechnologies.value = [data.backendTechnology];
      selectedBackendTechnology.value = data.backendTechnology.id.toString();

      // databaseTechnologies.value = [data.databaseTechnology];
      selectedDatabaseTechnology.value = data.databaseTechnology.id.toString();

      // categories.value = [data.category];
      selectedCategory.value = data.category.id.toString();

      // members.value = [data.members];
      members.value = data.group.groupParticipants;

      images.clear();
      _removedImages.clear();
      for (var element in data.media) {
        images.add(ProjectImages(img: element));
      }
      isProjectSuccess.value = true;
    } else {
      titleController.clear();
      descriptionController.clear();
      frontendTechnologies.clear();
      backendTechnologies.clear();
      databaseTechnologies.clear();
      categories.clear();
      images.clear();
      isProjectSuccess.value = false;
      _removedImages.clear();
    }
    isProjectLoading.value = false;
    return;
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

  Future<void> fetchTechnologies() async {
    await Future.wait([
      fetchFrontendTechnologies(),
      fetchBackendTechnologies(),
      fetchDatabaseTechnologies(),
      fetchCategories(),
    ]);
    return;
  }

  Future<void> fetchFrontendTechnologies() async {
    var data = await ProjectOperationProvider().fetchFrontendTechnologies();
    if (data != null) {
      frontendTechnologies.value = data.data;
    }
    return;
  }

  Future<void> fetchBackendTechnologies() async {
    var data = await ProjectOperationProvider().fetchBackendTechnologies();
    if (data != null) {
      backendTechnologies.value = data.data;
    }
    return;
  }

  Future<void> fetchDatabaseTechnologies() async {
    var data = await ProjectOperationProvider().fetchDatabaseTechnologies();
    if (data != null) {
      databaseTechnologies.value = data.data;
    }
    return;
  }

  Future<void> fetchCategories() async {
    var data = await ProjectOperationProvider().fetchCategories();
    if (data != null) {
      categories.value = data.data;
    }
    return;
  }

  addImage(File image) {
    images.add(ProjectImages(file: image));
  }

  removeImage() {
    int index =
        currentSlide > images.length - 1 ? images.length - 1 : currentSlide;
    var currentImage = images[index];
    if (currentImage.file == null) {
      _removedImages.add(currentImage.img?.id ?? 0);
    }
    images.removeAt(index);
  }
}
