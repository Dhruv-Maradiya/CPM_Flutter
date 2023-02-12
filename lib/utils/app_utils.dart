import 'package:cpm/core/constants/pallets.dart';
import 'package:cpm/views/sign_in_as_student/sign_in_as_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppUtils {
  static Widget getFullScreenLoader({
    Indicator indicatorType = Indicator.circleStrokeSpin,
    Color backgroundColor = Colors.black45,
    Color loaderColor = Colors.white,
  }) {
    return Container(
      color: backgroundColor,
      height: Get.size.height,
      width: Get.size.width,
      child: Center(
          child: SizedBox(
        height: 50,
        width: 50,
        child: LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin,
          colors: [loaderColor],
          strokeWidth: 3,
        ),
      )),
    );
  }

  static signInPopUp() async {
    await showGeneralDialog(
        context: Get.context!,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(Get.context!).modalBarrierDismissLabel,
        barrierColor: Pallets.dialogBlurBlackColor,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Dismissible(
                key: const Key("key"),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  Get.back();
                },
                child: Stack(
                  children: [
                    Container(
                      width: 320,
                      margin: const EdgeInsets.only(top: 35),
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                          color: Pallets.dialogBgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          )),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Projectify",
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'To use this feature you have to login, please login and try again',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline6!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Pallets.primaryColor,
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 30,
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign in",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.off(const SignInAsStudentScreen());
                              }),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Pallets.primaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.all(3),
                          height: 65,
                          width: 65,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Pallets.primaryColor,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Pallets.white,
                                width: 3,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/user_1_5.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  static List<Widget> buildCarousel(List<String> images) {
    return images
        .map(
          (image) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        .toList();
  }
}
