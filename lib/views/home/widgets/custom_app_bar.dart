import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/home/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/routes.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool isMenubarToShow;
  final String title;
  final Color backgroundColor;
  final List<Widget> actions;
  CustomAppBar({
    Key? key,
    required this.isMenubarToShow,
    required this.title,
    this.backgroundColor = Pallets.appBarColor,
    this.actions = const [],
  }) : super(key: key);

  HomeScreenController homeScreenController = HomeScreenController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: isMenubarToShow
            ? IconButton(
                icon: const Icon(Icons.menu),
                color: Pallets.primaryColor,
                iconSize: 35,
                onPressed: () async {
                  var result =
                      await SharedPreferencesClass.getSharePreference();
                  if (result != null) {
                    // ignore: use_build_context_synchronously
                    Scaffold.of(context).openDrawer();
                  } else {
                    AppUtils.signInPopUp();
                  }
                },
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
      actions: isMenubarToShow
          ? [
              // Obx(
              //   () => homeScreenController.isNotifications.value
              //       ? IconButton(
              //           icon: const Icon(Icons.notifications),
              //           color: Pallets.primaryColor,
              //           iconSize: 30,
              //           onPressed: () => {},
              //         )
              //       : IconButton(
              //           icon: const Icon(Icons.notifications_active),
              //           color: Pallets.primaryColor,
              //           iconSize: 30,
              //           onPressed: () => {},
              //         ),
              // ),
              GestureDetector(
                onTap: () async {
                  var result =
                      await SharedPreferencesClass.getSharePreference();
                  if (result != null) {
                    Get.toNamed(Routes.profile);
                  } else {
                    AppUtils.signInPopUp();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 8, right: 18, bottom: 8, left: 8),
                  decoration: const BoxDecoration(
                    color: Pallets.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Image.asset('assets/images/user.png'),
                ),
              )
            ]
          : actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
