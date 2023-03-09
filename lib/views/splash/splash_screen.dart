import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:projectify/core/constants/pallets.dart';
import 'package:projectify/views/splash/controllers/splash_controller.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallets.white,
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.png',
          height: MediaQuery.of(context).size.height * 0.25,
        ),
      ),
    );
  }
}
