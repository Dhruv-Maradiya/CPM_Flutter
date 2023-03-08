import 'package:get/get.dart';
import 'package:projectify/views/groups/models/groups_model.dart'
    as groups_model;
import 'package:projectify/views/groups/providers/groups_provider.dart';

class GroupsController extends GetxController {
  var groups = <groups_model.Group>[].obs;

  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMyGroups();
  }

  Future<void> fetchMyGroups() async {
    isLoading.value = true;
    isSuccess.value = false;
    var data = await GroupsProvider().fetchMyGroups();

    if (data != null) {
      groups.value = data.data.groups;
      isSuccess.value = true;
    }
    isLoading.value = false;
    return;
  }
}
