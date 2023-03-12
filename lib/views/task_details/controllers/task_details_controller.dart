import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/task_details/providers/task_details_provider.dart';

class TaskDetailsController extends GetxController {
  RxBool isSubmitting = false.obs;
  RxBool isSuccess = false.obs;

  RxString selectedStatus = "".obs;

  void updateTask(dynamic data) async {
    try {
      isSubmitting.value = true;
      isSuccess.value = await TaskDetailsProvider().update(data);

      Get.back(result: 'Refresh');
    } catch (e) {
      isSubmitting.value = false;
      isSuccess.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
      );
    }
  }
}
