import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/views/home/widgets/project_card_widget.dart';
import 'package:projectify/views/projects/controllers/projects_controller.dart';

// ignore: must_be_immutable
class ProjectsWidget extends StatelessWidget {
  ProjectsWidget({super.key});

  final ProjectsController _projectsController = Get.put(ProjectsController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Pallets.primaryColor,
      onRefresh: () async => _projectsController.getProjects(),
      child: Scaffold(
        backgroundColor: Pallets.scaffoldBgColor,
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
                      ? ListView.builder(
                          itemBuilder: ((context, index) => ProjectCardWidget(
                                project: _projectsController.projects[index],
                                isRedirectToProjectDetails: false,
                              )),
                          itemCount: _projectsController.projects.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
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
      ),
    );
  }
}