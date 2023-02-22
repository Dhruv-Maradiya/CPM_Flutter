import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/home/models/home_screen_model.dart'
    as HomeScreenModel;
import 'package:projectify/core/constants/routes.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});
  final HomeScreenModel.Project project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Get.toNamed(Routes.projectDetails, arguments: {"project": project}),
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Pallets.scaffoldBgColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
        ),
        margin: const EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: AppUtils.buildCarousel(
                  project.media.map((e) => e.url).toList(),
                ),
                options: CarouselOptions(
                  aspectRatio: 16 / 12,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 7),
                  enlargeCenterPage: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          project.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Pallets.projectCardTitle,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        project.isVerified
                            ? const Icon(
                                Icons.verified,
                                size: 14,
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      project.description,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Pallets.projectCardDescription,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
