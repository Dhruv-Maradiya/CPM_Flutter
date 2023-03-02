import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/views/create_task/models/group_member_model.dart';
import 'package:projectify/views/create_task/providers/create_task_provider.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';

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
  TextEditingController priorityController = TextEditingController();

  String? selectedStatus;
  String? selectedMember;

  RxBool isGroupLoading = false.obs;
  RxBool isGroupSuccess = false.obs;
  Rx<GroupDetails?> groupDetails = null.obs;

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
}
