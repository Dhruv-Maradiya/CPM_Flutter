import 'package:cached_network_image/cached_network_image.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/home/models/home_screen_model.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
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
      appBar: CustomAppBar(isMenubarToShow: false, title: "Project"),
      drawer: HomeScreenDrawer(),
      body: SafeArea(
        bottom: false,
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
                    items: AppUtils.buildCarousel(
                        project.media.map((e) => e.url).toList()),
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
                              project.name,
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
                          children: _buildTechnologyStack(project),
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
                          children: project.group.groupParticipants.map(
                            (member) {
                              String profilePicture = member.student.url;
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    profilePicture.isNotEmpty
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: CachedNetworkImage(
                                              imageUrl: profilePicture,
                                              width: 40,
                                              height: 40,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(
                                                color: Pallets.primaryColor,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.black,
                                            ),
                                            width: 40,
                                            height: 40,
                                            child: Center(
                                              child: Image.asset(
                                                'assets/images/user.png',
                                              ),
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            member.student.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF575757),
                                            ),
                                          ),
                                          Text(
                                            member.student.enrollmentNo,
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
                                      member.student.branch.displayName,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ).toList(),
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
                            fontSize: 20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: project.projectGuideMapping
                              .map((guide) => _buildGuideWidget(guide: guide))
                              .toList(),
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

  Widget _buildGuideWidget({required ProjectGuideMapping guide}) {
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
          guide.faculty.url.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  // child: Image.network(
                  //   guide.faculty.url,
                  //   width: 40,
                  //   height: 40,
                  // ),
                  child: CachedNetworkImage(
                    imageUrl: guide.faculty.url,
                    width: 40,
                    height: 40,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      color: Pallets.primaryColor,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
              guide.faculty.name,
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

  List<Widget> _buildTechnologyStack(Project project) {
    return [
      _buildTechnologyWidget(
          technology: Technology(
        name: project.frontendTechnology.name,
        id: project.frontendTechnology.id,
        description: project.frontendTechnology.description,
        logo: project.frontendTechnology.logo,
        logoUrl: project.frontendTechnology.logoUrl,
        url: project.frontendTechnology.url,
      )),
      _buildTechnologyWidget(
        technology: Technology(
          name: project.backendTechnology.name,
          id: project.backendTechnology.id,
          description: project.backendTechnology.description,
          logo: project.backendTechnology.logo,
          logoUrl: project.backendTechnology.logoUrl,
          url: project.backendTechnology.url,
        ),
      ),
      _buildTechnologyWidget(
        technology: Technology(
          name: project.databaseTechnology.name,
          id: project.databaseTechnology.id,
          description: project.databaseTechnology.description,
          logo: project.databaseTechnology.logo,
          logoUrl: project.databaseTechnology.logoUrl,
          url: project.databaseTechnology.url,
        ),
      ),
    ];
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
          // Image.network(
          //   technology.logoUrl,
          //   width: 40,
          //   height: 40,
          // ),
          CachedNetworkImage(
            imageUrl: technology.logoUrl,
            width: 40,
            height: 40,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Pallets.primaryColor,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
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
}
