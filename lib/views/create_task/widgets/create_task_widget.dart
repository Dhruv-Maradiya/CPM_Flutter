import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/common/widgets/dropdown.dart';
import 'package:projectify/views/common/widgets/text_field.dart';
import 'package:projectify/views/create_task/controllers/create_task_controller.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';

class CreateTaskWidget extends StatelessWidget {
  CreateTaskWidget({super.key});

  final CreateTaskController _createTaskController =
      Get.put(CreateTaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        isMenubarToShow: true,
      ),
      drawer: HomeScreenDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Pallets.white,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/create_task_img.png",
                        height: 68,
                        width: 107,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Flexible(
                        child: Text(
                          'Let\'s complete your task together',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(25, 25, 25, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CommonTextField(
                title: "Title",
                hintText: "Title",
                maxLines: null,
              ),
              const SizedBox(
                height: 20,
              ),
              CommonTextField(
                title: "Description",
                hintText: "Description",
                maxLines: 4,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonDropDown(
                      onChanged: (value) {},
                      items: [],
                      hintText: "",
                      validator: (val) {},
                      label: const Text(
                        "Assign to",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Pallets.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CommonDropDown(
                      onChanged: (value) {},
                      items: [],
                      hintText: "",
                      validator: (val) {},
                      label: const Text(
                        "Priority",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Pallets.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonTextField(
                      hintText: '',
                      maxLines: null,
                      title: 'Start Date',
                      suffixIcons: const Icon(
                        Icons.date_range,
                        color: Pallets.dialogBlurBlackColor,
                      ),
                      keyboardType: TextInputType.none,
                      controller: _createTaskController.startDateController,
                      isReadOnly: true,
                      onTap: () async {
                        var date = await _selectDate(context,
                            _createTaskController.selectedStartDate.value);
                        if (date != null) {
                          _createTaskController.selectedStartDate.value = date;
                          _createTaskController.startDateController.text =
                              "${date.day}/${date.month}/${date.year}";
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CommonTextField(
                      hintText: '',
                      maxLines: null,
                      title: 'End Date',
                      suffixIcons: const Icon(
                        Icons.date_range,
                        color: Pallets.dialogBlurBlackColor,
                      ),
                      isReadOnly: true,
                      keyboardType: TextInputType.none,
                      controller: _createTaskController.endDateController,
                      onTap: () async {
                        var date = await _selectDate(context,
                            _createTaskController.selectedEndDate.value);
                        if (date != null) {
                          _createTaskController.selectedEndDate.value = date;
                          _createTaskController.endDateController.text =
                              "${date.day}/${date.month}/${date.year}";
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CommonDropDown(
                onChanged: (value) {},
                items: [],
                hintText: "",
                validator: (val) {},
                label: const Text(
                  "Status",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {},
                color: Pallets.primaryColor,
                height: 52,
                minWidth: double.maxFinite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Pallets.scaffoldBgColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context, date) async {
    DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    return picked;
  }
}
