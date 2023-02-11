import 'package:cpm/core/constants/pallets.dart';
import 'package:cpm/utils/app_utils.dart';
import 'package:cpm/views/home/widgets/custom_app_bar.dart';
import 'package:cpm/views/home/widgets/home_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class ProjectDetailsWidget extends StatelessWidget {
  ProjectDetailsWidget({super.key});

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Project project = data['project'];
    return Scaffold(
      backgroundColor: Pallets.appBgColor,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Pallets.appBgColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: AppUtils.buildCarousel(project.images),
                    options: CarouselOptions(
                      aspectRatio: 16 / 11,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 7),
                      enlargeCenterPage: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              project.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            project.isVerified
                                ? const Icon(
                                    Icons.verified,
                                    size: 20,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Description:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4F4F4F),
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          project.description,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF848484),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Technology stack:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4F4F4F),
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          project.description,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF848484),
                            fontSize: 14,
                          ),
                          // maxLines: 3,
                          // overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
