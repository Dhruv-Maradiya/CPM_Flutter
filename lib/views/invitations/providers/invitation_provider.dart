import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_client.dart';
import 'package:projectify/rest/rest_constants.dart';
import 'package:projectify/views/invitations/models/invitation_model.dart';

class InvitationProvider {
  Future<List<InvitationForGroup>?> fetchSentInvitations(dynamic params) async {
    try {
      ApiRequest request = ApiRequest(
          url: RestConstants.sentInvitations, queryParameters: params);
      ApiResponseModel response = await request.get();

      if (response.success) {
        return InvitationModel.fromJson(response.data).data.invitationForGroup;
      } else {
        final ApiErrorModel apiErrorModel =
            ApiErrorModel.fromJson(response.error);

        Get.snackbar(apiErrorModel.name, apiErrorModel.message,
            isDismissible: true,
            duration: const Duration(seconds: 3),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Pallets.errorColor);
      }
      return null;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
      );
    }
    return null;
  }

  Future<List<InvitationForGroup>?> fetchReceivedInvitations(
      dynamic params) async {
    try {
      ApiRequest request = ApiRequest(
          url: RestConstants.receivedInvitations, queryParameters: params);
      ApiResponseModel response = await request.get();

      if (response.success) {
        return InvitationModel.fromJson(response.data).data.invitationForGroup;
      } else {
        final ApiErrorModel apiErrorModel =
            ApiErrorModel.fromJson(response.error);

        Get.snackbar(
          apiErrorModel.name,
          apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor,
        );
      }
      return null;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
      );
    }
    return null;
  }

  Future<InvitationForGroup?> updateInvitation(dynamic data) async {
    try {
      ApiRequest request =
          ApiRequest(url: RestConstants.updateInvitation, data: data);
      ApiResponseModel response = await request.put();

      if (response.success) {
        return InvitationForGroup.fromJson(response.data["data"]);
      } else {
        final ApiErrorModel apiErrorModel =
            ApiErrorModel.fromJson(response.error);

        Get.snackbar(
          apiErrorModel.name,
          apiErrorModel.message,
          isDismissible: true,
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallets.errorColor,
        );
      }
      return null;
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        isDismissible: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallets.errorColor,
      );
    }
    return null;
  }
}
