import 'package:cpm/views/home/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHomeScreen: false, title: "Notifications"),
      body: Container(),
    );
  }
}
