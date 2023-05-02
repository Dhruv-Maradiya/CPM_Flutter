import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:flutter/material.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/views/home/controllers/home_screen_drawer_controller.dart';
import 'package:projectify/core/constants/routes.dart';

// ignore: must_be_immutable
class HomeScreenDrawer extends StatelessWidget {
  HomeScreenDrawer({super.key});

  final HomeScreenDrawerController _homeScreenDrawerController =
      Get.put(HomeScreenDrawerController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.65,
        child: SafeArea(
          child: Container(
            color: Pallets.appBgColor,
            child: Column(
              children: [
                Obx(
                  () => Expanded(
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
                        // Home
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Get.currentRoute == Routes.home
                                ? Pallets.appBarColor
                                : Pallets.appBgColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: ListTile(
                            onTap: () {
                              Scaffold.of(context).closeDrawer();
                              Get.toNamed(Routes.home);
                            },
                            leading: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Pallets.secondaryColor,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.home_filled,
                                  color: Pallets.primaryColor,
                                  size: 30,
                                ),
                              ),
                            ),
                            title: const Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Pallets.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        // PROJECTS
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Get.currentRoute.contains(Routes.projects)
                                ? Pallets.appBarColor
                                : Pallets.appBgColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: ListTile(
                            onTap: () {
                              Scaffold.of(context).closeDrawer();
                              Get.toNamed(Routes.projects);
                            },
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
                        ),
                        // GROUPS
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Get.currentRoute.contains(Routes.groups)
                                ? Pallets.appBarColor
                                : Pallets.appBgColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: ListTile(
                            onTap: () {
                              Scaffold.of(context).closeDrawer();
                              Get.toNamed(Routes.groups);
                            },
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
                        ),
                        _homeScreenDrawerController.userType.value ==
                                UserType.faculty
                            ? Column(
                                children: [
                                  // Students
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get.currentRoute
                                              .contains(Routes.students)
                                          ? Pallets.appBarColor
                                          : Pallets.appBgColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: ListTile(
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
                                  ),
                                  // Faculties
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get.currentRoute
                                              .contains(Routes.faculties)
                                          ? Pallets.appBarColor
                                          : Pallets.appBgColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: ListTile(
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
                                  ),
                                  // Branches
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get.currentRoute
                                              .contains(Routes.branches)
                                          ? Pallets.appBarColor
                                          : Pallets.appBgColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: ListTile(
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
                                  ),
                                  // ACADEMICS
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get.currentRoute
                                              .contains(Routes.academics)
                                          ? Pallets.appBarColor
                                          : Pallets.appBgColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: ListTile(
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
                                    ),
                                  ), //
                                  // TECHNOLOGIES
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get.currentRoute.contains(
                                              Routes.backendTechnology)
                                          ? Pallets.appBarColor
                                          : Pallets.appBgColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: ListTile(
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
                                  ),
                                  // Categories
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get.currentRoute
                                              .contains(Routes.categories)
                                          ? Pallets.appBarColor
                                          : Pallets.appBgColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: ListTile(
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
                                        'Categories',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Pallets.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get.currentRoute
                                              .contains(Routes.invitations)
                                          ? Pallets.appBarColor
                                          : Pallets.appBgColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                        Scaffold.of(context).closeDrawer();
                                        Get.toNamed(Routes.invitations);
                                      },
                                      leading: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Pallets.secondaryColor,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/icons8-invitation-60.png',
                                            height: 30,
                                            width: 30,
                                          ),
                                        ),
                                      ),
                                      title: const Text(
                                        'Invitations',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Pallets.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => {
                    Scaffold.of(context).openEndDrawer(),
                    Get.toNamed(Routes.privacyPolicy),
                  },
                  child: const Text(
                    "Privacy & Policy",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Pallets.primaryColor,
                      decoration: TextDecoration.underline,
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
      ),
    );
  }

  void navigate(String route) {
    Get.toNamed(route)
        ?.then((value) => _homeScreenDrawerController.changePage());
  }
}
