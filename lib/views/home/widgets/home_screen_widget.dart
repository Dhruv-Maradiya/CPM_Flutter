import 'package:carousel_slider/carousel_slider.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/utils/app_utils.dart';
import 'package:projectify/views/home/controllers/home_screen_controller.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/views/project_details/project_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter {
  Filter({required this.title, required this.isSelected, required this.id});
  final String title;
  final bool isSelected;
  final int id;
}

class Project {
  Project({
    required this.title,
    required this.isVerified,
    required this.id,
    required this.images,
    required this.description,
  });

  final String title;
  final bool isVerified;
  final int id;
  final List<String> images;
  final String description;
}

// ignore: must_be_immutable
class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({super.key});

  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());

  List<Filter> filters = [
    Filter(title: 'All Projects', isSelected: true, id: 1),
    Filter(title: 'Gaming', isSelected: false, id: 2),
    Filter(title: 'Management', isSelected: false, id: 3),
    Filter(title: 'Robotics', isSelected: false, id: 4),
    Filter(title: 'Missions', isSelected: false, id: 5),
    Filter(title: 'Gaming', isSelected: false, id: 6),
    Filter(title: 'Robotics', isSelected: false, id: 7),
    Filter(title: 'Gaming', isSelected: false, id: 8),
  ];

  List<Project> projects = [
    Project(
      title: 'Projectify',
      isVerified: true,
      id: 1,
      images: [
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
      ],
      description:
          'The Himalayas, or Himalaya, is a mountain range in Asia separating the plains of the Indian subcontinent from the Indian Ocean. It is the largest mountain in the world, and the highest mountain in the world, Mount Everest.',
    ),
    Project(
      title: 'Projectify',
      isVerified: true,
      id: 2,
      images: [
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
      ],
      description:
          'The Himalayas, or Himalaya, is a mountain range in Asia separating the plains of the Indian subcontinent from the Indian Ocean. It is the largest mountain in the world, and the highest mountain in the world, Mount Everest.',
    ),
    Project(
      title: 'Projectify',
      isVerified: true,
      id: 3,
      images: [
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
      ],
      description:
          "The Himalayas, or Himalaya, is a mountain range in Asia separating the plains of the Indian subcontinent from the Indian Ocean. It is the largest mountain in the world, and the highest mountain in the world, Mount Everest.",
    ),
    Project(
      title: 'Projectify',
      isVerified: true,
      id: 4,
      images: [
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
      ],
      description:
          "The Himalayas, or Himalaya, is a mountain range in Asia separating the plains of the Indian subcontinent from the Indian Ocean. It is the largest mountain in the world, and the highest mountain in the world, Mount Everest.",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallets.appBgColor,
      appBar: CustomAppBar(isHomeScreen: true, title: 'Projectify'),
      drawer: const HomeScreenDrawer(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            color: Pallets.appBgColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Material(
                        elevation: 2.5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: TextField(
                          controller: _homeScreenController.searchController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Pallets.primaryColor,
                            ),
                            fillColor: Pallets.searchBarColor,
                            filled: true,
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            focusColor: Pallets.primaryColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Pallets.primaryColor,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _buildFilters(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: _buildProjects(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFilters() {
    return filters.map((filter) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: filter.isSelected
                ? Pallets.homeFilterSelectedColor
                : Pallets.homeFilterNonSelectedColor),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 7,
        ),
        margin: const EdgeInsets.only(right: 10),
        child: Text(
          filter.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: filter.isSelected ? Colors.white : Colors.black,
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildProjects() {
    return projects.map((project) {
      return GestureDetector(
        onTap: () => {
          Get.to(const ProjectDetailsScreen(), arguments: {"project": project}),
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
                  items: AppUtils.buildCarousel(project.images),
                  options: CarouselOptions(
                    aspectRatio: 16 / 12,
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
                            project.title,
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
    }).toList();
  }
}
