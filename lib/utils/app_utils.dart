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
