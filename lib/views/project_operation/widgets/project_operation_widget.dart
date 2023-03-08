import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/utils/app_utils.dart';
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
    return Stack(
      children: [
        Scaffold(
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
                  child: TabBar(
                    controller: _controller.tabController,
                    tabs: const [
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
                    controller: _controller.tabController,
                    children: [
                      _buildTasks(context),
                      _buildProject(context),
                      _buildMember(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => _controller.isProjectLoading.value &&
                  _controller.tabController.index == 1
              ? AppUtils.getFullScreenLoader()
              : const SizedBox.shrink(),
        )
      ],
    );
  }

  Widget _buildTasks(BuildContext context) {
    if (data == null) {
      Get.back();
      return const SizedBox.shrink();
    }
    final Project project = data['project'];
    pull_to_refresh.RefreshController refreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
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
                        child: (_controller
                                    .tasks.value?.data.tasks.isNotEmpty ??
                                true)
                            ? ListView.builder(
                                itemCount: _controller.totalTasks.value,
                                padding: const EdgeInsets.only(bottom: 20),
                                itemBuilder: (context, index) {
                                  final task = _controller
                                      .tasks.value?.data.tasks[index];
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                              )
                            : const Center(
                                child: Text(
                                "No Tasks created yet",
                              )),
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
    final Project project = data['project'];
    return RefreshIndicator(
      onRefresh: () async {
        _controller.fetchTechnologies();
        _controller.fetchProject(projectId: project.id);
      },
      color: Pallets.primaryColor,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _controller.projectFormKey,
            child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _controller.images.isEmpty
                        ? Container(
                            color: Pallets.uploadBgColor,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  _selectImages();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: Pallets.primaryColor,
                                        width: 0.5),
                                  ),
                                  height: 60,
                                  child: Stack(
                                    alignment: AlignmentDirectional.centerStart,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                          )
                        : Material(
                            color: Pallets.appBarColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CarouselSlider(
                                    items: _controller.images.map((image) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: image.file != null
                                            ? Image.file(image.file as File)
                                            : image.img == null
                                                ? const SizedBox.shrink()
                                                : CachedNetworkImage(
                                                    imageUrl:
                                                        image.img?.url ?? "",
                                                    placeholder:
                                                        (context, url) =>
                                                            const SizedBox(
                                                      height: 60,
                                                      width: 60,
                                                      child: Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Pallets
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                      );
                                    }).toList(),
                                    options: CarouselOptions(
                                      aspectRatio: 16 / 12,
                                      autoPlay: true,
                                      enableInfiniteScroll: false,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 800),
                                      viewportFraction: 1,
                                      autoPlayInterval:
                                          const Duration(seconds: 7),
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, reason) {
                                        _controller.currentSlide = index;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: Pallets.appBgColor,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Pallets.primaryColor,
                                          ),
                                          padding: const EdgeInsets.all(2),
                                          onPressed: () {
                                            _controller.removeImage();
                                          },
                                          color: Pallets.primaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      _controller.images.length < 4
                                          ? Material(
                                              color: Pallets.appBgColor,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Pallets.primaryColor,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(2),
                                                onPressed: () {
                                                  _selectImages();
                                                },
                                                color: Pallets.primaryColor,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
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
                        controller: _controller.titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Title is required";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonTextField(
                        title: "Description",
                        hintText: "Description",
                        maxLines: 4,
                        controller: _controller.descriptionController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 10) {
                            return "Description is required and should be at least 10 characters long";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => CommonDropDown(
                          label: const Text(
                            "Frontend",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Pallets.primaryColor,
                            ),
                          ),
                          onChanged: _controller.frontendTechnologies.isNotEmpty
                              ? (value) {
                                  _controller.selectedFrontendTechnology.value =
                                      value ?? "";
                                }
                              : null,
                          items: _controller.frontendTechnologies
                              .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(
                                    e.name,
                                  )))
                              .toList(),
                          value: _controller
                                  .selectedFrontendTechnology.value.isNotEmpty
                              ? _controller.selectedFrontendTechnology.value
                              : null,
                          hintText: "Frontend Technology",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select frontend technology";
                            }
                            return null;
                          },
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => CommonDropDown(
                          label: const Text(
                            "Backend",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Pallets.primaryColor,
                            ),
                          ),
                          onChanged: _controller.backendTechnologies.isNotEmpty
                              ? (value) {
                                  _controller.selectedBackendTechnology.value =
                                      value ?? "";
                                }
                              : null,
                          value: _controller
                                  .selectedBackendTechnology.value.isNotEmpty
                              ? _controller.selectedBackendTechnology.value
                              : null,
                          items: _controller.backendTechnologies
                              .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(
                                    e.name,
                                  )))
                              .toList(),
                          hintText: "Backend Technology",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select backend technology";
                            }
                            return null;
                          },
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => CommonDropDown(
                          label: const Text(
                            "Database",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Pallets.primaryColor,
                            ),
                          ),
                          onChanged: _controller.databaseTechnologies.isNotEmpty
                              ? (value) {
                                  _controller.selectedDatabaseTechnology.value =
                                      value ?? "";
                                }
                              : null,
                          value: _controller
                                  .selectedDatabaseTechnology.value.isNotEmpty
                              ? _controller.selectedDatabaseTechnology.value
                              : null,
                          items: _controller.databaseTechnologies
                              .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(
                                    e.name,
                                  )))
                              .toList(),
                          hintText: "Database Technology",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select database technology";
                            }
                            return null;
                          },
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => CommonDropDown(
                          label: const Text(
                            "Category",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Pallets.primaryColor,
                            ),
                          ),
                          onChanged: _controller.categories.isNotEmpty
                              ? (value) {
                                  _controller.selectedCategory.value =
                                      value ?? "";
                                }
                              : null,
                          value: _controller.selectedCategory.value.isNotEmpty
                              ? _controller.selectedCategory.value
                              : null,
                          items: _controller.categories
                              .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(
                                    e.name,
                                  )))
                              .toList(),
                          hintText: "Category",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select category";
                            }
                            return null;
                          },
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (_controller.projectFormKey.currentState!
                            .validate()) {
                          // validate images
                          if (_controller.images.isNotEmpty) {
                            _controller.updateProject();
                          } else {
                            Get.snackbar(
                                "Error", "Please select at least one image",
                                backgroundColor: Pallets.errorColor);
                          }
                        }
                      },
                      color: Pallets.primaryColor,
                      height: 52,
                      minWidth: double.maxFinite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Update',
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
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildMember(BuildContext context) {
    final Project project = data['project'];

    pull_to_refresh.RefreshController refreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
    void onRefresh() async {
      await Future.wait([
        _controller.fetchTechnologies(),
        _controller.fetchProject(projectId: project.id),
      ]);
      refreshController.refreshCompleted();
    }

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Obx(
            () => pull_to_refresh.SmartRefresher(
              enablePullDown: true,
              controller: refreshController,
              onRefresh: onRefresh,
              header: const pull_to_refresh.ClassicHeader(
                completeDuration: Duration(seconds: 1),
              ),
              child: ListView.builder(
                  itemCount: _controller.members.length,
                  itemBuilder: (context, index) {
                    var member = _controller.members[index];
                    return Container(
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
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          member.student.profilePicture.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: CachedNetworkImage(
                                    imageUrl: member.student.url,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Image.asset(
                                  'assets/images/ellipse_4.png',
                                  height: 45,
                                  width: 45,
                                ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member.student.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  member.student.enrollmentNo,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              member.student.branch.displayName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
        _buildAddButton(
          context,
          () {
            _controller.fetchInviteStudents();
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
    pull_to_refresh.RefreshController refreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
    onLoading() async {
      await _controller.fetchMoreInviteStudents();
      refreshController.loadComplete();
      _controller.inviteStudents.refresh();
    }

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
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Material(
                        elevation: 2.5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: Obx(() => TextField(
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Pallets.primaryColor,
                                ),
                                fillColor: Pallets.searchBarColor,
                                filled: true,
                                hintText: 'Enrollment No.',
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon:
                                    _controller.searchStudentCancellable.value
                                        ? InkWell(
                                            onTap: () {
                                              _controller.searchStudent.clear();
                                              _controller
                                                  .searchStudentCancellable
                                                  .value = false;
                                              _controller.fetchInviteStudents(
                                                  isNecessary: true);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Pallets.primaryColor,
                                            ),
                                          )
                                        : null,
                                focusColor: Pallets.primaryColor,
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  _controller.searchStudentCancellable.value =
                                      true;
                                } else {
                                  _controller.searchStudentCancellable.value =
                                      false;
                                }
                              },
                              onTapOutside: (value) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),
                              onSubmitted: (value) {
                                _controller.fetchInviteStudents();
                              },
                              cursorColor: Pallets.primaryColor,
                              keyboardType: TextInputType.number,
                              controller: _controller.searchStudent,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Obx(() => _controller
                                .isInviteStudentsLoading.value
                            ? const SizedBox(
                                height: 50,
                                width: 50,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Pallets.primaryColor,
                                )),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _controller.inviteStudents.isNotEmpty
                                    ? Obx(() => pull_to_refresh.SmartRefresher(
                                          controller: refreshController,
                                          onLoading: onLoading,
                                          enablePullUp: _controller
                                                  .totalInviteStudents.value >
                                              _controller.inviteStudents.length,
                                          enablePullDown: false,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: _controller
                                                .inviteStudents.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var student = _controller
                                                  .inviteStudents[index];
                                              return Card(
                                                color: Pallets.white,
                                                elevation: 1.5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  side: const BorderSide(
                                                    color: Pallets.primaryColor,
                                                    width: .25,
                                                  ),
                                                ),
                                                margin: const EdgeInsets.only(
                                                    bottom: 20),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10,
                                                  ),
                                                  child: Expanded(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        student.profilePicture
                                                                .isNotEmpty
                                                            ? ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      student
                                                                          .url,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  height: 45,
                                                                  width: 45,
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      const CircularProgressIndicator(),
                                                                ))
                                                            : Image.asset(
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
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                student.name,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              Text(
                                                                student
                                                                    .enrollmentNo,
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Obx(() => Checkbox(
                                                              activeColor: Pallets
                                                                  .primaryColor,
                                                              value: _controller
                                                                  .selectedStudents
                                                                  .value
                                                                  .contains(
                                                                      student
                                                                          .id),
                                                              onChanged:
                                                                  (value) {
                                                                if (value !=
                                                                    null) {
                                                                  if (value) {
                                                                    _controller
                                                                        .selectedStudents
                                                                        .add(student
                                                                            .id);
                                                                    _controller
                                                                        .inviteStudents;
                                                                    _controller
                                                                        .sortInviteStudents();
                                                                    _controller
                                                                        .sortInviteStudents();
                                                                    _controller
                                                                        .inviteStudents
                                                                        .refresh();
                                                                  } else {
                                                                    _controller
                                                                        .selectedStudents
                                                                        .removeWhere((element) =>
                                                                            element ==
                                                                            student.id);
                                                                    _controller
                                                                        .sortInviteStudents();
                                                                    _controller
                                                                        .inviteStudents
                                                                        .refresh();
                                                                  }
                                                                }
                                                              },
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ))
                                    : const Center(
                                        child: Text(
                                        'No students found',
                                      )),
                              )),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: MaterialButton(
                      onPressed: () {
                        if (_controller.selectedStudents.isNotEmpty) {
                          _controller.invite();
                        }
                      },
                      color: Pallets.primaryColor,
                      height: 52,
                      minWidth: double.maxFinite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Obx(() => Text(
                            _controller.selectedStudents.isEmpty
                                ? 'Invite'
                                : 'Invite (${_controller.selectedStudents.length})',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Pallets.scaffoldBgColor,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => _controller.isInvitationSending.value
                  ? AppUtils.getFullScreenLoader()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  void _selectImages() async {
    final images = await ImagePicker().pickMultiImage();

    if (images.isNotEmpty) {
      int total = images.length + _controller.images.length;
      if (total > 4) {
        Get.snackbar(
          "Error",
          "You can only select 4 images",
          backgroundColor: Pallets.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        images.removeRange(total - 4 - 1, images.length);
      }

      for (var element in images) {
        bool isAlreadyExists = false;
        final Uint8List bytes = await element.readAsBytes();
        final String base64Image = base64Encode(bytes);
        final int imageIndex = base64Image.length;
        for (var image in _controller.images.value) {
          if (image.file != null && image.file != null) {
            final Uint8List bytes = await image.file!.readAsBytes();
            final String base64Image = base64Encode(bytes);
            final int index = base64Image.length;

            if (imageIndex == index) {
              isAlreadyExists = true;
              Get.snackbar(
                "Error",
                "Image already exists",
                backgroundColor: Pallets.errorColor,
                snackPosition: SnackPosition.BOTTOM,
              );
              break;
            }
          }
        }
        if (!isAlreadyExists) {
          _controller.addImage(File(element.path));
        }
      }
    }
  }
}
