import 'package:flutter/material.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';

class ProjectOperationWidget extends StatelessWidget {
  const ProjectOperationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Pallets.appBgColor,
        drawer: HomeScreenDrawer(),
        appBar: CustomAppBar(isMenubarToShow: true, title: ""),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Pallets.appBgColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Pallets.tabBarBottomBorderColor,
                      width: 0.5,
                    ),
                  ),
                ),
                child: const TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Tasks",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Pallets.primaryColor,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Project",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Pallets.primaryColor,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Member",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Pallets.primaryColor,
                        ),
                      ),
                    )
                  ],
                  indicatorColor: Pallets.primaryColor,
                  indicatorWeight: 1,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildTasks(context),
                    _buildProject(context),
                    _buildMember(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTasks(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Pallets.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Pallets.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Pallets.white,
                            width: 2,
                          ),
                        ),
                        height: 55,
                        width: 55,
                        child: Center(
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Pallets.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Pallets.white,
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "64%",
                                style: TextStyle(
                                  color: Pallets.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "your daily goals Almost done!",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Pallets.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "16 of 21 completed",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Pallets.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Tasks",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Pallets.primaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: Pallets.taskCompletedBackgroundColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Pallets.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.check,
                              color: Pallets.primaryColor,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        __buildAddButton(context, () {})
      ],
    );
  }

  Widget _buildProject(BuildContext context) {
    return const Center(
      child: Text("Tasks"),
    );
  }

  Widget _buildMember(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Pallets.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Pallets.primaryColor.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 1.5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/ellipse_4.png',
                        height: 45,
                        width: 45,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "John Doe",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "206330307033",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Text(
                        "CE",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          __buildAddButton(context, () {})
        ],
      ),
    );
  }

  Widget __buildAddButton(BuildContext context, void Function() onTap) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              color: Pallets.primaryColor,
              shape: BoxShape.circle,
            ),
            height: 65,
            width: 65,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Pallets.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Pallets.white,
                    width: 3,
                  ),
                ),
                height: 40,
                width: 40,
                child: const Icon(
                  Icons.add,
                  color: Pallets.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
