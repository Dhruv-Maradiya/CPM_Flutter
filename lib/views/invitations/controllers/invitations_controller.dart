import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitationsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
