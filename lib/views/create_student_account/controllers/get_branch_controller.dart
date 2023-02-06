import 'package:cpm/views/create_student_account/providers/get_branches_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:cpm/views/create_student_account/models/get_branches_model.dart'
    as branch_model;

class GetBranchController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<branch_model.Data> branches = (List<branch_model.Data>.of([])).obs;

  void getBranches(BuildContext context) async {
    isLoading.value = true;
    try {
      final response = (await GetBranchProvider().getBranches(context))!.data;

      branches.addAll(response);
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
