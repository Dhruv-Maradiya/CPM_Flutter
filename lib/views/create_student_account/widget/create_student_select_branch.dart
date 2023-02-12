import 'package:cpm/core/constants/pallets.dart';
import 'package:cpm/views/create_student_account/controllers/create_student_account_controller.dart';
import 'package:cpm/views/profile/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class SelectBranchDropDownState extends StatelessWidget {
  final CreateStudentAccountController getBranchController =
      Get.put(CreateStudentAccountController());

  bool isDisabled = false;

  SelectBranchDropDownState({super.key, required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: Pallets.textFieldBgColor,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Pallets.primaryColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Pallets.primaryColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Pallets.primaryColor,
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Pallets.primaryColor,
            ),
          ),
        ),
        onChanged: isDisabled
            ? null
            : (String? value) {
                getBranchController.selectedBranch = int.parse(value!);
              },
        hint: const Text("Branch"),
        items: getBranchController.branches.isNotEmpty
            ? getBranchController.branches.map(
                (e) {
                  return DropdownMenuItem<String>(
                    value: e.id.toString(),
                    child: Text(e.displayName),
                  );
                },
              ).toList()
            : null,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select branch";
          }
        },
      ),
    );
  }
}
