import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/invitations/models/invitation_model.dart';
import 'package:projectify/views/invitations/providers/invitation_provider.dart';

class InvitationsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  late final UserReturn user;

  var sentInvitations = <InvitationForGroup>[].obs;
  var receivedInvitations = <InvitationForGroup>[].obs;

  RxBool isSentInvitationsLoading = false.obs;
  RxBool isReceivedInvitationsLoading = false.obs;

  RxBool isSentInvitationSuccess = false.obs;
  RxBool isReceivedInvitationSuccess = false.obs;

  RxBool isUpdateInvitationLoading = false.obs;
  RxBool isUpdateInvitationSuccess = false.obs;

  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    var data = await SharedPreferencesClass.getSharePreference();

    if (data != null) {
      user = data;
    }
    fetchSentInvitations();
    fetchReceivedInvitations();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> fetchSentInvitations() async {
    isSentInvitationsLoading.value = true;
    isSentInvitationSuccess.value = false;
    var data = await InvitationProvider().fetchSentInvitations({
      "leaderId": user.userId,
    });

    if (data != null) {
      sentInvitations.value = data;
      isSentInvitationSuccess.value = true;
    } else {
      isSentInvitationSuccess.value = false;
    }
    isSentInvitationsLoading.value = false;
    return;
  }

  Future<void> fetchReceivedInvitations() async {
    isReceivedInvitationsLoading.value = true;
    isReceivedInvitationSuccess.value = false;
    var data = await InvitationProvider().fetchReceivedInvitations({
      "studentId": user.userId,
    });

    if (data != null) {
      receivedInvitations.value = data;
      isReceivedInvitationSuccess.value = true;
    } else {
      isReceivedInvitationSuccess.value = false;
    }
    isReceivedInvitationsLoading.value = false;
    return;
  }

  Future<void> updateInvitation(
      {required String status, required int id}) async {
    isUpdateInvitationLoading.value = true;
    isUpdateInvitationSuccess.value = false;
    var data = await InvitationProvider().updateInvitation({
      "id": id,
      "status": status,
    });

    if (data != null) {
      isUpdateInvitationSuccess.value = true;
      for (int i = 0; i < receivedInvitations.length; i++) {
        if (receivedInvitations[i].id == id) {
          receivedInvitations[i] = data;
        }
      }
      receivedInvitations.refresh();
    }
    isUpdateInvitationLoading.value = false;
  }
}
