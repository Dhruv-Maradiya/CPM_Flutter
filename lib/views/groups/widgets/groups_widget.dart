import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Pallets.primaryColor,
      onRefresh: () async {},
      child: Scaffold(
        appBar: CustomAppBar(
          title: '',
          isMenubarToShow: true,
        ),
        backgroundColor: Pallets.appBgColor,
        drawer: HomeScreenDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 20),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                color: Pallets.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Maradiya\'s Spartans',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    const Divider(color: Pallets.primaryColor, thickness: .5),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/ellipse_4.png',
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Leader',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Pallets.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Dhruv Maradiya',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Pallets.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '206330307033',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400,
                                        color: Pallets.primaryColor,
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Project Title',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Pallets.primaryColor,
                                ),
                              ),
                              Text(
                                'Projectify',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Pallets.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
