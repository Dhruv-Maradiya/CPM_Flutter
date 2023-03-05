import 'package:get/get.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/project_operation/models/project_operation_tasks.dart';
import 'package:projectify/views/project_operation/providers/project_operation_provider.dart';

class ProjectOperationController extends GetxController {
  RxBool isTasksLoading = false.obs;
  RxBool isTasksSuccess = false.obs;
  RxBool isProjectLoading = false.obs;
  Rx<ProjectOperationTasksModel?> tasks = null.obs;

  RxInt totalTasks = 0.obs;

  RxBool hasMoreTasks = false.obs;

  @override
  void onInit() {
    super.onInit();

    var data = Get.arguments;
    final Project project = data['project'];

    fetchTasks(projectId: project.id);
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
}
