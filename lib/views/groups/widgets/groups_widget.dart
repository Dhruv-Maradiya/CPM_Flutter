import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/core/constants/routes.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/groups/controllers/groups_controller.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as pull_to_refresh;

class GroupsWidget extends StatelessWidget {
  GroupsWidget({super.key});

  final GroupsController _controller = Get.put(GroupsController());

  @override
  Widget build(BuildContext context) {
    pull_to_refresh.RefreshController refreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
    onRefresh() async {
      await _controller.fetchMyGroups();
      refreshController.loadComplete();
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        isMenubarToShow: true,
      ),
      backgroundColor: Pallets.appBgColor,
      drawer: HomeScreenDrawer(),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 20),
          child: _controller.isLoading.value
              ? const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      color: Pallets.primaryColor,
                    ),
                  ),
                )
              : _controller.isSuccess.value
                  ? pull_to_refresh.SmartRefresher(
                      controller: refreshController,
                      onRefresh: onRefresh,
                      header: const pull_to_refresh.ClassicHeader(
                        completeDuration: Duration(seconds: 1),
                      ),
                      enablePullDown: true,
                      child: ListView.builder(
                        itemCount: _controller.groups.length,
                        itemBuilder: (context, index) {
                          var group = _controller.groups[index];
                          var leader = group.groupParticipants.firstWhere(
                            (element) => element.role == 'LEADER',
                          );
                          var project = group.projects;
                          return InkWell(
                            onTap: () async {
                              if (project == null) {
                                var currentUser = await SharedPreferencesClass
                                    .getSharePreference();
                                if (currentUser != null) {
                                  if (currentUser.userId == leader.student.id) {
                                    Get.toNamed(Routes.createProject,
                                        arguments: {
                                          'groupId': group.id,
                                          'academicsId': group.academic.id,
                                          'onCreate':
                                              (Project project, int groupId) {
                                            for (var element
                                                in _controller.groups) {
                                              if (element.id == groupId) {
                                                element.projects = project;
                                                // rerender the list
                                                _controller.groups.refresh();
                                                break;
                                              }
                                            }
                                          }
                                        });
                                  }
                                }
                              } else {
                                Get.toNamed(Routes.projectOperation,
                                    arguments: {"project": project});
                              }
                            },
                            child: Card(
                              margin: const EdgeInsets.only(bottom: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 3,
                              color: Pallets.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    group.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Divider(
                                      color: Pallets.primaryColor,
                                      thickness: .5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: project != null
                                          ? CrossAxisAlignment.start
                                          : CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/ellipse_4.png',
                                                width: 40,
                                                height: 40,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Leader',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Pallets
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      leader.student.name,
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Pallets
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      leader
                                                          .student.enrollmentNo,
                                                      style: const TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Pallets
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ])
                                            ],
                                          ),
                                        ),
                                        project != null
                                            ? Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Project Title',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Pallets
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      project.name,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Pallets
                                                            .primaryColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : const Expanded(
                                                flex: 1,
                                                child: Text(
                                                  'No Project Found!',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Pallets.errorColor,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            _controller.fetchMyGroups();
                          },
                          icon: const Icon(
                            Icons.refresh,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
