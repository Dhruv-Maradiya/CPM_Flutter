import 'package:get/state_manager.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/projects/providers/projects_provider.dart';

class ProjectsController extends GetxController {
  List<Project> projects = [];
  RxInt count = 0.obs;
  RxInt loadedProjects = 0.obs;
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
    loadedProjects.value = projects.length;
  }

  loadMoreProjects() async {
    int skip = loadedProjects.value;
    int take = 10;
    var user = await SharedPreferencesClass.getSharePreference();

    if (user == null) {
      return null;
    }
    var data = await ProjectsProvider().getProjects({
      "studentId": user.userId,
      "skip": skip,
      "take": take,
    });
    if (data != null) {
      if (data.data.projects.isEmpty == true) {
        projects.addAll(data.data.projects);
      } else {
        projects = data.data.projects;
      }
      count.value = data.data.count;
      loadedProjects.value = loadedProjects.value + data.data.projects.length;
    }
  }
}
