import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/common/widgets/dropdown.dart';
import 'package:projectify/views/create_student_account/controllers/create_student_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

// ignore: must_be_immutable
class SelectBranchDropDownState extends StatelessWidget {
  final CreateStudentAccountController getBranchController =
      Get.put(CreateStudentAccountController());

  bool isDisabled = false;

  SelectBranchDropDownState({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    onChanged(String? value) {
      getBranchController.selectedBranch = int.parse(value!);
    }

    List<DropdownMenuItem<String>>? items =
        getBranchController.branches.isNotEmpty
            ? getBranchController.branches.map(
                (e) {
                  return DropdownMenuItem<String>(
                    value: e.id.toString(),
                    child: Text(e.displayName),
                  );
                },
              ).toList()
            : null;

    validator(value) {
      if (value == null || value.isEmpty) {
        return "Please select branch";
      }
      return null;
    }

    return Obx(
      () => CommonDropDown(
        onChanged: getBranchController.isBranchLoading.value || isDisabled
            ? null
            : onChanged,
        items: items,
        hintText: "Branch",
        validator: validator,
        label: const Text(
          "Branch Name",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Pallets.primaryColor,
          ),
        ),
      ),
    );
  }
}
