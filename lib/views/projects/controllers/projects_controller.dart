import 'package:get/state_manager.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/projects/providers/projects_provider.dart';

class ProjectsController extends GetxController {
  List<Project> projects = [];
  RxInt count = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProjects();
  }

  void getProjects() async {
    isLoading.value = true;
    var user = await SharedPreferencesClass.getSharePreference();

    if (user == null) {
      return null;
    }

    var data = await ProjectsProvider().getProjects({
      "studentId": user.userId,
    });
    isLoading.value = false;
    projects = data?.data.projects ?? [];
    count.value = data?.data.count ?? 0;
  }
}
