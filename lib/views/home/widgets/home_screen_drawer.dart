import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:flutter/material.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/home/controllers/home_screen_drawer_controller.dart';

// ignore: must_be_immutable
class HomeScreenDrawer extends StatelessWidget {
  HomeScreenDrawer({super.key});

  final HomeScreenDrawerController _homeScreenDrawerController =
      Get.put(HomeScreenDrawerController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      child: SafeArea(
        bottom: false,
        child: Container(
          color: Pallets.appBgColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/menu_icon.png',
                            height: 30,
                            width: 30,
                          ),
                          Positioned(
                            right: 0,
                            top: 12.6,
                            child: Container(
                              height: 4.5,
                              width: 15,
                              decoration: const BoxDecoration(
                                color: Pallets.appBgColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // PROJECTS
              const SizedBox(
                height: 30,
              ),
              ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Pallets.secondaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/projects_4.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                title: const Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Pallets.primaryColor,
                  ),
                ),
              ),
              // GROUPS
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Pallets.secondaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/group_icon.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                title: const Text(
                  'Groups',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Pallets.primaryColor,
                  ),
                ),
              ),
              Obx(
                () => _homeScreenDrawerController.isLoading.value == false &&
                        _homeScreenDrawerController.userType == UserType.faculty
                    ? Column(
                        children: [
                          // Students
                          const SizedBox(
                            height: 12,
                          ),
                          ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Pallets.secondaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/student_icon.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                            title: const Text(
                              'Students',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Pallets.primaryColor,
                              ),
                            ),
                          ),
                          // Faculties
                          const SizedBox(
                            height: 12,
                          ),
                          ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Pallets.secondaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/faculty_icon.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                            title: const Text(
                              'Faculties',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Pallets.primaryColor,
                              ),
                            ),
                          ),
                          // Branches
                          const SizedBox(
                            height: 12,
                          ),
                          ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Pallets.secondaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/branch_icon.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                            title: const Text(
                              'Branches',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Pallets.primaryColor,
                              ),
                            ),
                          ),
                          // ACADEMICS
                          const SizedBox(
                            height: 12,
                          ),
                          ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Pallets.secondaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/academic_icon.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                            title: const Text(
                              'Academics',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Pallets.primaryColor,
                              ),
                            ),
                          ), //
                          // TECHNOLOGIES
                          const SizedBox(
                            height: 12,
                          ),
                          ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Pallets.secondaryColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/technology_icon.png',
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                            title: const Text(
                              'Technologies',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Pallets.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
