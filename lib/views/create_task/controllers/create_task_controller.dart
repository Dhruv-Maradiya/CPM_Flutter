import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/create_task/models/group_member_model.dart';
import 'package:projectify/views/create_task/providers/create_task_provider.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/project_operation/controllers/project_operation_controller.dart';

class CreateTaskController extends GetxController {
  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndDate = DateTime.now().obs;

  final formKey = GlobalKey<FormState>();

  TextEditingController startDateController = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController endDateController = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String? selectedStatus;
  String? selectedMember;
  int? selectedPriority;

  RxBool isGroupLoading = false.obs;
  RxBool isGroupSuccess = false.obs;
  Rx<GroupDetails?> groupDetails = null.obs;

  RxBool isSubmitting = false.obs;
  RxBool isSuccess = false.obs;

  @override
  void onInit() {
    super.onInit();
    var data = Get.arguments;

    var project = data["project"] as Project;

    fetchGroupDetails(project: project);
  }

  void fetchGroupDetails({required Project project}) async {
    isGroupLoading.value = true;
    var data = await CreateTaskProvider().fetchGroupDetails({
      "id": project.group.id,
    });
    if (data != null) {
      groupDetails = data.obs;
      isGroupSuccess.value = true;
    } else {
      isGroupSuccess.value = false;
    }
    isGroupLoading.value = false;
  }

  void createTask({required int projectId, required callback}) async {
    isSuccess.value = false;

    var user = await SharedPreferencesClass.getSharePreference();

    if (user != null) {
      isSubmitting.value = true;

      var data = await CreateTaskProvider().createTask({
        "name": titleController.text,
        "description": descriptionController.text,
        "priority": selectedPriority ?? 5,
        "startDate": startDateController.text,
        "endDate": endDateController.text,
        "status": selectedStatus,
        "assignedToParticipantId": selectedMember,
        "projectId": projectId,
        "createdByLeaderId": user.userId,
      });
      if (data == true) {
        isSuccess.value = true;
        isSubmitting.value = false;

        await callback(projectId: projectId);

        Get.back();
        Get.snackbar(
          "Success",
          "Task created successfully",
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.successColor,
        );
      } else {
        isSuccess.value = false;
        isSubmitting.value = false;
      }
      isSubmitting.value = false;
    } else {
      Get.snackbar(
        "Authentication Error",
        "You need to be logged in to create a task",
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
      );
    }
  }
}
