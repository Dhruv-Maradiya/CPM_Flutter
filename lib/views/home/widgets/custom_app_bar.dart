import 'package:cpm/core/constants/pallets.dart';
import 'package:cpm/views/home/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool isHomeScreen;
  final String title;
  CustomAppBar({Key? key, required this.isHomeScreen, required this.title})
      : super(key: key);

  HomeScreenController homeScreenController = HomeScreenController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Pallets.appBarColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: isHomeScreen
            ? IconButton(
                icon: const Icon(Icons.menu),
                color: Pallets.primaryColor,
                iconSize: 35,
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
            : IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Pallets.primaryColor,
        ),
      ),
      elevation: 0,
      actions: isHomeScreen
          ? [
              Obx(
                () => homeScreenController.isNotifications.value
                    ? IconButton(
                        icon: const Icon(Icons.notifications),
                        color: Pallets.primaryColor,
                        iconSize: 30,
                        onPressed: () => {
                          homeScreenController.isNotifications.value =
                              !homeScreenController.isNotifications.value
                        },
                      )
                    : GestureDetector(
                        onTap: () => {
                          homeScreenController.isNotifications.value =
                              !homeScreenController.isNotifications.value
                        },
                        child: Image.asset(
                          'assets/images/active_notification.png',
                        ),
                      ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 8, right: 18, bottom: 8, left: 8),
                  decoration: const BoxDecoration(
                    color: Pallets.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 4,
                    //       spreadRadius: 0,
                    //       offset: Offset(0, 4),
                    //       color: Color.fromRGBO(0, 0, 0, 25))
                    // ],
                  ),
                  child: Image.asset('assets/images/user.png'),
                ),
              )
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
