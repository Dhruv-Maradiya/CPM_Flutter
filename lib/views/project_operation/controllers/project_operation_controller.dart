import 'package:get/state_manager.dart';
import 'package:projectify/views/project_operation/models/project_operation_tasks.dart';
import 'package:projectify/views/project_operation/providers/project_operation_provider.dart';

class ProjectOperationController extends GetxController {
  RxBool isTasksLoading = false.obs;
  RxBool isTasksSuccess = false.obs;
  RxBool isProjectLoading = false.obs;
  Rx<ProjectOperationTasksModel?> tasks = null.obs;

  fetchTasks({
    required int projectId,
  }) async {
    try {
      isTasksLoading.value = true;
      var data = await ProjectOperationProvider().fetchTasks({
        "projectId": projectId,
      });
      if (data != null) {
        tasks = data.obs;
      }
      isTasksSuccess.value = true;
      isTasksLoading.value = false;
    } catch (e) {
      isTasksLoading.value = false;
      isTasksSuccess.value = false;
    }
  }
}
