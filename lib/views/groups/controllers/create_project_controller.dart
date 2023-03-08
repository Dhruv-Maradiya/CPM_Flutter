import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectify/views/groups/providers/create_project_provider.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/project_operation/providers/project_operation_provider.dart';

class CreateProjectController extends GetxController {
  // Create project

  RxBool isLoading = false.obs;

  final projectFormKey = GlobalKey<FormState>();

  var images = <File>[].obs;

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

  @override
  void onInit() {
    super.onInit();
    fetchTechnologies();
  }

  Future<Project?> create({
    required int groupId,
    required int academicId,
  }) async {
    isLoading.value = true;

    final imagesFormData = await Future.wait(images.map((e) async {
      return dio.MultipartFile.fromFile(e.path,
          filename: e.path.split('/').last);
    }));
    var formData = dio.FormData.fromMap({
      "files": imagesFormData,
      'name': titleController.text,
      'description': descriptionController.text,
      'groupId': groupId,
      'academicId': academicId,
      'frontendTechnologyId': selectedFrontendTechnology.value,
      'backendTechnologyId': selectedBackendTechnology.value,
      'databaseTechnologyId': selectedDatabaseTechnology.value,
      'categoryId': selectedCategory.value,
    });

    var response = await CreateProjectProvider().createProject(data: formData);

    isLoading.value = false;
    return response;
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
    images.add(image);
  }

  removeImage() {
    int index =
        currentSlide > images.length - 1 ? images.length - 1 : currentSlide;

    images.removeAt(index);
  }
}
