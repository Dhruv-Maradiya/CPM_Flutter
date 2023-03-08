import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/views/home/widgets/project_card_widget.dart';
import 'package:projectify/views/projects/controllers/projects_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as pull_to_refresh;

// ignore: must_be_immutable
class ProjectsWidget extends StatelessWidget {
  ProjectsWidget({super.key});

  final ProjectsController _projectsController = Get.put(ProjectsController());

  @override
  Widget build(BuildContext context) {
    pull_to_refresh.RefreshController refreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
    onLoading() async {
      await _projectsController.loadMoreProjects();
      refreshController.loadComplete();
    }

    return Scaffold(
      backgroundColor: Pallets.appBgColor,
      drawer: HomeScreenDrawer(),
      appBar: CustomAppBar(isMenubarToShow: true, title: "Projects"),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Obx(
                () => _projectsController.isLoading.value == false
                    ? _projectsController.isSuccess.value
                        ? pull_to_refresh.SmartRefresher(
                            physics: const AlwaysScrollableScrollPhysics(),
                            enablePullDown: true,
                            enablePullUp: _projectsController.count.value >
                                _projectsController.loadedProjects.value,
                            controller: refreshController,
                            onLoading: onLoading,
                            onRefresh: () async {
                              _projectsController.getProjects();
                            },
                            header: const pull_to_refresh.ClassicHeader(
                              completeDuration: Duration(seconds: 1),
                            ),
                            child: _projectsController.projects.isNotEmpty
                                ? ListView.builder(
                                    itemBuilder: ((context, index) =>
                                        ProjectCardWidget(
                                          project: _projectsController
                                              .projects[index],
                                          isRedirectToProjectDetails: false,
                                        )),
                                    itemCount: _projectsController
                                        .loadedProjects.value,
                                    shrinkWrap: true,
                                  )
                                : const Center(
                                    child: Text(
                                      "No projects found",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                          )
                        : Expanded(
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  _projectsController.getProjects();
                                },
                                child: const Icon(
                                  Icons.refresh,
                                  color: Pallets.primaryColor,
                                  size: 50,
                                ),
                              ),
                            ),
                          )
                    : const SizedBox.shrink(),
              ),
            ),
            Obx(
              () => _projectsController.isLoading.value == true
                  ? const Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Pallets.primaryColor,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
