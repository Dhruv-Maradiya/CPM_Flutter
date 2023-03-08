import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/groups/models/groups_model.dart';
import 'package:get/get.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';

class GroupsProvider {
  Future<GroupsModel?> fetchMyGroups() async {
    ApiRequest request = ApiRequest(url: RestConstants.fetchMyGroup);
    ApiResponseModel response = await request.get();

    if (response.success) {
      return GroupsModel.fromJson(response.data);
    } else {
      final ApiErrorModel apiErrorModel =
          ApiErrorModel.fromJson(response.error);

      Get.snackbar(apiErrorModel.name, apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor);

      return null;
    }
  }
}
