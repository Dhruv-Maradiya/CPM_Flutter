import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/home/controllers/home_screen_controller.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/views/home/widgets/project_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as pull_to_refresh;

// ignore: must_be_immutable
class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({super.key});

  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    pull_to_refresh.RefreshController refreshController =
        pull_to_refresh.RefreshController(
      initialRefresh: false,
    );
    onLoading() async {
      await _homeScreenController.loadMoreProjects();
      refreshController.loadComplete();
    }

    return Scaffold(
      backgroundColor: Pallets.appBgColor,
      appBar: CustomAppBar(isMenubarToShow: true, title: 'Projectify'),
      drawer: HomeScreenDrawer(),
      body: SafeArea(
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
                      onSubmitted: (value) => _homeScreenController.fetch(),
                      onTapOutside: (value) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                  Obx(
                    () => _homeScreenController.isLoading.value == true
                        ? const SizedBox.shrink()
                        : _homeScreenController.isSuccess.value
                            ? Expanded(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Obx(() => Row(
                                            children: _buildFilters(),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    _buildProjects(
                                      onLoading: onLoading,
                                      refreshController: refreshController,
                                    ),
                                  ],
                                ),
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
    );
  }

  List<Widget> _buildFilters() {
    final int selectedFilter =
        _homeScreenController.selectedCategoryIndex.value;
    return [
      GestureDetector(
        onTap: () {
          _homeScreenController.selectedCategoryIndex.value = 0;
          _homeScreenController.fetch();
        },
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
            _homeScreenController.fetch();
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

  Widget _buildProjects(
      {required pull_to_refresh.RefreshController refreshController,
      required VoidCallback onLoading}) {
    if (_homeScreenController.homeScreenModel?.data == null) {
      return const SizedBox.shrink();
    }

    return Expanded(
      child: pull_to_refresh.SmartRefresher(
        enablePullDown: true,
        enablePullUp: _homeScreenController.hasMoreProjects.value,
        controller: refreshController,
        onLoading: onLoading,
        onRefresh: () async {
          _homeScreenController.fetch();
        },
        header: const pull_to_refresh.ClassicHeader(
          completeDuration: Duration(seconds: 1),
        ),
        child: _homeScreenController.loadedProjects.value > 0 &&
                !_homeScreenController.isLoading.value
            ? ListView.builder(
                // physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _homeScreenController.loadedProjects.value,
                itemBuilder: (context, index) {
                  return ProjectCardWidget(
                    project: _homeScreenController
                        .homeScreenModel!.data.projects[index],
                    isRedirectToProjectDetails: true,
                  );
                },
              )
            : const Center(
                child: Text(
                "No projects found",
              )),
      ),
    );
  }
}
