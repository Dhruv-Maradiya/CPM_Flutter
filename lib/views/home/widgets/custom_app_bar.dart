import 'package:cpm/core/constants/pallets.dart';
import 'package:cpm/views/home/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({Key? key}) : super(key: key);

  HomeScreenController homeScreenController = HomeScreenController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Pallets.appBarColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: IconButton(
          icon: const Icon(Icons.menu),
          color: Pallets.primaryColor,
          iconSize: 35,
          onPressed: () => {},
        ),
      ),
      centerTitle: true,
      title: const Text(
        'Projectify',
        style: TextStyle(
          color: Pallets.primaryColor,
        ),
      ),
      elevation: 0,
      actions: [
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
            margin:
                const EdgeInsets.only(top: 8, right: 18, bottom: 8, left: 8),
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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
