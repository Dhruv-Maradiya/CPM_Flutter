import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/home/controllers/home_screen_controller.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/views/home/widgets/project_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({super.key});

  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallets.appBgColor,
      appBar: CustomAppBar(isMenubarToShow: true, title: 'Projectify'),
      drawer: HomeScreenDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _homeScreenController.fetch(),
        color: Pallets.primaryColor,
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 2.5,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                    Obx(
                      () => _homeScreenController.isLoading.value == true
                          ? const SizedBox.shrink()
                          : _homeScreenController.isSuccess.value
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: _buildFilters(),
                                      ),
                                    ),
                                    NotificationListener<
                                        OverscrollIndicatorNotification>(
                                      onNotification: (overscroll) {
                                        overscroll.disallowIndicator();
                                        return true;
                                      },
                                      child: _buildProjects(),
                                    ),
                                  ],
                                )
                              : Expanded(
                                  child: Center(
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        _homeScreenController.fetch();
                                      },
                                      backgroundColor: Pallets.primaryColor,
                                      child: const Icon(
                                        Icons.refresh,
                                      ),
                                    ),
                                  ),
                                ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => _homeScreenController.isLoading.value == true
                    ? const Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: Pallets.primaryColor,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFilters() {
    final int selectedFilter =
        _homeScreenController.selectedCategoryIndex.value;
    return [
      GestureDetector(
        onTap: () => _homeScreenController.selectedCategoryIndex.value = 0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: selectedFilter == 0
                  ? Pallets.homeFilterSelectedColor
                  : Pallets.homeFilterNonSelectedColor),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
          margin: const EdgeInsets.only(right: 10),
          child: Text(
            "All Projects",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selectedFilter == 0 ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      ...?_homeScreenController.homeScreenModel?.data.categories.categories
          .map((filter) {
        return GestureDetector(
          onTap: () {
            _homeScreenController.selectedCategoryIndex.value = filter.id;
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: filter.id == selectedFilter
                  ? Pallets.homeFilterSelectedColor
                  : Pallets.homeFilterNonSelectedColor,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            margin: const EdgeInsets.only(right: 10),
            child: Text(
              filter.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    filter.id == selectedFilter ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    ];
  }

  Widget _buildProjects() {
    if (_homeScreenController.homeScreenModel?.data == null) {
      return const SizedBox.shrink();
    }
    // return _homeScreenController.homeScreenModel!.data.projects.map((project) {
    //   return ProjectCardWidget(
    //     project: project,
    //     isRedirectToProjectDetails: true,
    //   );
    // }).toList();

    return ListView.builder(
      // physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _homeScreenController.homeScreenModel!.data.projects.length,
      itemBuilder: (context, index) {
        return ProjectCardWidget(
          project: _homeScreenController.homeScreenModel!.data.projects[index],
          isRedirectToProjectDetails: true,
        );
      },
    );
  }
}
