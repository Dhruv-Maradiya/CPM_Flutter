import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/common/widgets/dropdown.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/views/project_operation/models/project_operation_tasks.dart';
import 'package:projectify/views/task_details/controllers/task_details_controller.dart';

class TaskDetailsWidget extends StatelessWidget {
  TaskDetailsWidget({super.key});

  final _controller = Get.put(TaskDetailsController());

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final task = data['task'] as Task;
    final bool isEditable = data['isEditable'] as bool;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Pallets.appBgColor,
          appBar: CustomAppBar(isMenubarToShow: true, title: ""),
          drawer: HomeScreenDrawer(),
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Pallets.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              "Title",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Pallets.primaryColor,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              task.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Pallets.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Pallets.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            task.description,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Pallets.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Assigned To",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Pallets.primaryColor,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  task.assignedToParticipant.name,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            color: Pallets.primaryColor,
                            height: 50,
                            width: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Priority",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Pallets.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  task.priority.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: Pallets.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Start Time",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Pallets.primaryColor,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      task.startTime
                                          .toString()
                                          .substring(0, 10),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.calendar_month_sharp)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            color: Pallets.primaryColor,
                            height: 50,
                            width: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "End Time",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Pallets.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      task.endTime.toString().substring(0, 10),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.calendar_month_sharp),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonDropDown(
                    onChanged: (String? value) {
                      _controller.selectedStatus.value = value ?? "";
                    },
                    bgColor: Pallets.white,
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem(
                        value: 'PENDING',
                        child: Text(
                          'Pending',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'IN_PROGRESS',
                        child: Text(
                          'In Progress',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'DELAYED',
                        child: Text(
                          'Delayed',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'COMPLETED',
                        child: Text(
                          'Completed',
                        ),
                      ),
                    ],
                    hintText: '',
                    value: task.status,
                    validator: null,
                    label: const Text(
                      'Status',
                      style: TextStyle(
                        color: Pallets.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  isEditable
                      ? MaterialButton(
                          onPressed: () {
                            if (_controller.selectedStatus.value != "") {
                              _controller.updateTask({
                                "id": task.id,
                                "status": _controller.selectedStatus.value,
                              });
                            } else {
                              Get.back();
                            }
                          },
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
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
        Obx(() => _controller.isSubmitting.value
            ? AppUtils.getFullScreenLoader()
            : const SizedBox.shrink())
      ],
    );
  }
}
