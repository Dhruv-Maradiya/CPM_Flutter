import 'package:get/get.dart';
import 'package:projectify/preference/shared_preference.dart';

class HomeScreenDrawerController extends GetxController {
  Rx<UserType> userType = UserType.none.obs;

  @override
  void onInit() {
    super.onInit();
    getUserType();
  }

  void getUserType() async {
    var user = await SharedPreferencesClass.getSharePreference();
    userType.value = user?.userType ?? UserType.none;
    update();
  }
}
