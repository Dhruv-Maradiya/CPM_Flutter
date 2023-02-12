import 'package:cpm/core/constants/pallets.dart';
import 'package:cpm/views/home/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isHomeScreen: false,
        title: 'Profile',
        backgroundColor: Pallets.appBgColor,
      ),
      backgroundColor: Pallets.appBgColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/ellipse_4.png',
                    height: 80,
                    width: 80,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Pallets.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        'assets/images/add_photo_4.png',
                        height: 15,
                        width: 15,
                        color: Pallets.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Dhruv Maradiya",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF414141),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Pallets.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
