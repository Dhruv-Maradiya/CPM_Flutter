import 'package:cpm/core/constants/pallets.dart';
import 'package:cpm/utils/app_utils.dart';
import 'package:cpm/views/home/widgets/custom_app_bar.dart';
import 'package:cpm/views/home/widgets/home_screen_drawer.dart';
import 'package:cpm/views/home/widgets/home_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';

class Technology {
  Technology({
    required this.name,
    required this.image,
    required this.id,
    required this.description,
  });

  final String name;
  final String image;
  final int id;
  final String description;
}

class Member {
  Member({
    required this.name,
    required this.image,
    required this.enrollmentNo,
    required this.branchName,
  });

  final String name;
  final String image;
  final String enrollmentNo;
  final String branchName;
}

class Guide {
  Guide({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;
}

// ignore: must_be_immutable
class ProjectDetailsWidget extends StatelessWidget {
  ProjectDetailsWidget({super.key});

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Project project = data['project'];
    return Scaffold(
      backgroundColor: Pallets.appBgColor,
      appBar: CustomAppBar(isHomeScreen: false, title: "Project"),
      drawer: const HomeScreenDrawer(),
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
                        // TECHNOLOGY STACK
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTechnologyWidget(
                              technology: Technology(
                                name: 'Flutter',
                                image:
                                    'https://branditechture.agency/brand-logos/wp-content/uploads/wpdm-cache/Flutter-900x0.png',
                                id: 1,
                                description:
                                    'Flutter is a front-end framework for building user interfaces.',
                              ),
                            ),
                            _buildTechnologyWidget(
                              technology: Technology(
                                name: 'Flutter',
                                image:
                                    'https://branditechture.agency/brand-logos/wp-content/uploads/wpdm-cache/Flutter-900x0.png',
                                id: 1,
                                description:
                                    'Flutter is a front-end framework for building user interfaces.',
                              ),
                            ),
                            _buildTechnologyWidget(
                              technology: Technology(
                                name: 'Flutter',
                                image:
                                    'https://branditechture.agency/brand-logos/wp-content/uploads/wpdm-cache/Flutter-900x0.png',
                                id: 1,
                                description:
                                    'Flutter is a front-end framework for building user interfaces.',
                              ),
                            ),
                          ],
                        ),
                        // MEMBERS
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Members:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4F4F4F),
                              fontSize: 20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildMemberWidget(
                              member: Member(
                                name: 'Dhruv Maradiya',
                                enrollmentNo: "206330307033",
                                image:
                                    "https://lh3.googleusercontent.com/ogw/AAEL6shsIrRSNdkUDGGD49ykhlSeJzrnWYNTYGfDVBLT=s64-c-mo",
                                branchName: "CE",
                              ),
                            ),
                            _buildMemberWidget(
                              member: Member(
                                name: 'Dhruv Maradiya',
                                enrollmentNo: "206330307033",
                                image: "",
                                branchName: "CE",
                              ),
                            ),
                            _buildMemberWidget(
                              member: Member(
                                name: 'Dhruv Maradiya',
                                enrollmentNo: "206330307033",
                                image:
                                    "https://lh3.googleusercontent.com/ogw/AAEL6shsIrRSNdkUDGGD49ykhlSeJzrnWYNTYGfDVBLT=s64-c-mo",
                                branchName: "CE",
                              ),
                            ),
                            _buildMemberWidget(
                              member: Member(
                                name: 'Dhruv Maradiya',
                                enrollmentNo: "206330307033",
                                image:
                                    "https://lh3.googleusercontent.com/ogw/AAEL6shsIrRSNdkUDGGD49ykhlSeJzrnWYNTYGfDVBLT=s64-c-mo",
                                branchName: "CE",
                              ),
                            ),
                          ],
                        ),
                        // Guides
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Guide:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4F4F4F),
                              fontSize: 20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildGuideWidget(
                              guide: Guide(
                                name: 'Amit Shah',
                                image:
                                    "https://lh3.googleusercontent.com/ogw/AAEL6shsIrRSNdkUDGGD49ykhlSeJzrnWYNTYGfDVBLT=s64-c-mo",
                              ),
                            ),
                            _buildGuideWidget(
                              guide: Guide(
                                name: 'Amit Shah',
                                image:
                                    "https://lh3.googleusercontent.com/ogw/AAEL6shsIrRSNdkUDGGD49ykhlSeJzrnWYNTYGfDVBLT=s64-c-mo",
                              ),
                            ),
                          ],
                        ),
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

  Widget _buildTechnologyWidget({required Technology technology}) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.2,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(technology.image, width: 40, height: 40),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  technology.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF575757),
                  ),
                ),
                Text(
                  technology.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberWidget({required Member member}) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.2,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          member.image.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    member.image,
                    width: 40,
                    height: 40,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Image.asset('assets/images/user.png'),
                  ),
                ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF575757),
                  ),
                ),
                Text(
                  member.enrollmentNo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Text(
            member.branchName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGuideWidget({required Guide guide}) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          guide.image.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    guide.image,
                    width: 40,
                    height: 40,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Image.asset('assets/images/user.png'),
                  ),
                ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              guide.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF575757),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
