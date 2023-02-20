import 'package:get/get.dart';
import 'package:projectify/preference/shared_preference.dart';

class HomeScreenDrawerController extends GetxController {
  UserType? userType;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getUserType();
    super.onInit();
  }

  void getUserType() async {
    isLoading.value = true;
    var user = await SharedPreferencesClass.getSharePreference();
    isLoading.value = false;
    userType = user?.userType;
  }
}
