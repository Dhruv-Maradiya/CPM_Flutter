import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/common/widgets/dropdown.dart';
import 'package:projectify/views/common/widgets/text_field.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/core/constants/routes.dart';
import 'package:projectify/views/project_operation/controllers/project_operation_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as pull_to_refresh;

// ignore: must_be_immutable
class ProjectOperationWidget extends StatelessWidget {
  ProjectOperationWidget({super.key});

  final ProjectOperationController _controller =
      Get.put(ProjectOperationController());

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    pull_to_refresh.RefreshController refreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Pallets.appBgColor,
        drawer: HomeScreenDrawer(),
        appBar: CustomAppBar(isMenubarToShow: true, title: ""),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Pallets.appBgColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Pallets.tabBarBottomBorderColor,
                      width: 0.5,
                    ),
                  ),
                ),
                child: const TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Tasks",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Pallets.primaryColor,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Project",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Pallets.primaryColor,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Member",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Pallets.primaryColor,
                        ),
                      ),
                    )
                  ],
                  indicatorColor: Pallets.primaryColor,
                  indicatorWeight: 1,
                ),
              ),
              Expanded(
                child: TabBarView(
                  // controller: DefaultTabController.of(context),
                  children: [
                    _buildTasks(context, refreshController: refreshController),
                    _buildProject(context),
                    _buildMember(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTasks(BuildContext context,
      {required pull_to_refresh.RefreshController refreshController}) {
    final Project project = data['project'];

    onLoading() async {
      await _controller.loadMoreTasks(projectId: project.id);
      refreshController.loadComplete();
    }

    return Stack(
      children: [
        Obx(() {
          if (_controller.isTasksLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: Pallets.primaryColor,
              ),
            );
          } else if (_controller.isTasksSuccess.value) {
            return Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Pallets.primaryColor,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       vertical: 12.0,
                  //       horizontal: 24,
                  //     ),
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //           decoration: BoxDecoration(
                  //             color: Pallets.primaryColor,
                  //             shape: BoxShape.circle,
                  //             border: Border.all(
                  //               color: Pallets.white,
                  //               width: 2,
                  //             ),
                  //           ),
                  //           height: 55,
                  //           width: 55,
                  //           child: Center(
                  //             child: Container(
                  //               height: 40,
                  //               width: 40,
                  //               decoration: BoxDecoration(
                  //                 color: Pallets.primaryColor,
                  //                 shape: BoxShape.circle,
                  //                 border: Border.all(
                  //                   color: Pallets.white,
                  //                   width: 1,
                  //                 ),
                  //               ),
                  //               child: const Center(
                  //                 child: Text(
                  //                   "64%",
                  //                   style: TextStyle(
                  //                     color: Pallets.white,
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 12,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: const [
                  //             Text(
                  //               "your daily goals Almost done!",
                  //               style: TextStyle(
                  //                 fontSize: 15,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Pallets.white,
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 5,
                  //             ),
                  //             Text(
                  //               "16 of 21 completed",
                  //               style: TextStyle(
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: Pallets.white,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Text(
                  //   "Tasks",
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.w700,
                  //     color: Pallets.primaryColor,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Obx(
                    () => Expanded(
                      child: pull_to_refresh.SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: _controller.hasMoreTasks.value,
                        controller: refreshController,
                        onLoading: onLoading,
                        onRefresh: () async {
                          _controller.fetchTasks(projectId: project.id);
                        },
                        header: const pull_to_refresh.ClassicHeader(
                          completeDuration: Duration(seconds: 1),
                        ),
                        child: ListView.builder(
                          itemCount: _controller.totalTasks.value,
                          padding: const EdgeInsets.only(bottom: 20),
                          itemBuilder: (context, index) {
                            final task =
                                _controller.tasks.value?.data.tasks[index];
                            if (task == null) {
                              return const SizedBox.shrink();
                            }
                            return Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(
                                top: 15,
                              ),
                              decoration: BoxDecoration(
                                color: task.status == "COMPLETED"
                                    ? Pallets.taskCompletedBackgroundColor
                                    : Pallets.white,
                                borderRadius: BorderRadius.circular(10),
                                border: task.status == "COMPLETED"
                                    ? null
                                    : Border.all(
                                        width: 0.75,
                                        color: Pallets.primaryColor,
                                      ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Pallets.white,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(6),
                                    height: 45,
                                    width: 45,
                                    child: const Icon(
                                      Icons.check,
                                      color: Pallets.primaryColor,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Pallets.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        task.description,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Pallets.primaryColor,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          // refresh button
          return Material(
              child: Center(
            child: FloatingActionButton(
              onPressed: () {
                _controller.fetchTasks(
                  projectId: project.id,
                );
              },
              backgroundColor: Pallets.primaryColor,
              child: const Icon(
                Icons.refresh,
              ),
            ),
          ));
        }),
        Obx(() => _controller.isTasksLoading.value == false &&
                _controller.isTasksSuccess.value == true
            ? _buildAddButton(
                context,
                () {
                  Get.toNamed(Routes.createTask, arguments: {
                    "project": project,
                  });
                },
              )
            : const SizedBox.shrink())
      ],
    );
  }

  Widget _buildProject(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Pallets.uploadBgColor,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border:
                          Border.all(color: Pallets.primaryColor, width: 0.5),
                    ),
                    height: 60,
                    child: Stack(
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Upload Images",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const Positioned(
                          child: Icon(
                            Icons.upload,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
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
            CommonDropDown(
              label: const Text(
                "Frontend",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Pallets.primaryColor,
                ),
              ),
              onChanged: null,
              items: const [
                DropdownMenuItem(
                  value: "1",
                  child: Text("Item 1"),
                ),
              ],
              hintText: "Frontend Technology",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select frontend technology";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonDropDown(
              label: const Text(
                "Backend",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Pallets.primaryColor,
                ),
              ),
              onChanged: null,
              items: const [
                DropdownMenuItem(
                  value: "1",
                  child: Text("Item 1"),
                ),
              ],
              hintText: "Backend Technology",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select backend technology";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonDropDown(
              label: const Text(
                "Database",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Pallets.primaryColor,
                ),
              ),
              onChanged: null,
              items: const [
                DropdownMenuItem(
                  value: "1",
                  child: Text("Item 1"),
                ),
              ],
              hintText: "Database Technology",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select database technology";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CommonDropDown(
              label: const Text(
                "Category",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Pallets.primaryColor,
                ),
              ),
              onChanged: null,
              items: const [
                DropdownMenuItem(
                  value: "1",
                  child: Text("Item 1"),
                ),
              ],
              hintText: "Category",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select category";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
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
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMember(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Pallets.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Pallets.primaryColor.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 1.5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/ellipse_4.png',
                        height: 45,
                        width: 45,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "John Doe",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "206330307033",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        "CE",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildAddButton(
          context,
          () {
            _showBottomSheet(context);
          },
        ),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context, void Function() onTap) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              color: Pallets.primaryColor,
              shape: BoxShape.circle,
            ),
            height: 65,
            width: 65,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Pallets.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Pallets.white,
                    width: 3,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(
                  Icons.add,
                  color: Pallets.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Pallets.scaffoldBgColor,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.8,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  const Material(
                    elevation: 2.5,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Pallets.primaryColor,
                        ),
                        fillColor: Pallets.searchBarColor,
                        filled: true,
                        hintText: 'Enrollment No.',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        focusColor: Pallets.primaryColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      cursorColor: Pallets.primaryColor,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Pallets.white,
                            elevation: 1.5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: Pallets.primaryColor,
                                width: .25,
                              ),
                            ),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10,
                              ),
                              child: Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/ellipse_4.png',
                                      height: 45,
                                      width: 45,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "John Doe",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "206330307033",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
              Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: MaterialButton(
                  onPressed: () {},
                  color: Pallets.primaryColor,
                  height: 52,
                  minWidth: double.maxFinite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Invite (2)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Pallets.scaffoldBgColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
