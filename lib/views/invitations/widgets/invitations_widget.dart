import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';
import 'package:projectify/views/invitations/controllers/invitations_controller.dart';

class InvitationsWidget extends StatelessWidget {
  InvitationsWidget({super.key});

  final InvitationsController _controller = Get.put(InvitationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isMenubarToShow: true,
        title: "",
      ),
      drawer: HomeScreenDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Pallets.appBarColor,
                  borderRadius: BorderRadius.circular(
                    7.0,
                  ),
                ),
                child: TabBar(
                  controller: _controller.tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      7.0,
                    ),
                    color: Pallets.primaryColor,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(
                      child: Text(
                        'Sent',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Received',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _controller.tabController,
                  children: const [
                    // first tab bar view widget
                    Center(
                      child: Text(
                        'Sent',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // second tab bar view widget
                    Center(
                      child: Text(
                        'Received',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
