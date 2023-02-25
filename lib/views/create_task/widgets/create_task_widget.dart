import 'package:flutter/material.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/home/widgets/custom_app_bar.dart';
import 'package:projectify/views/home/widgets/home_screen_drawer.dart';

class CreateTaskWidget extends StatelessWidget {
  const CreateTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        isMenubarToShow: true,
      ),
      drawer: HomeScreenDrawer(),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        margin: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Pallets.white,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/create_task_img.png",
                        height: 68,
                        width: 107,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Flexible(
                        child: Text(
                          'Let\'s complete your task together',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(25, 25, 25, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
