import 'package:cpm/views/home/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
