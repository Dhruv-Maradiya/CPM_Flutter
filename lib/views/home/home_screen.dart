import 'package:get/get.dart';
import 'package:projectify/main_controller.dart';
import 'package:projectify/views/home/widgets/home_screen_widget.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:upgrader/upgrader.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    // const appCastURL = 'http://mypredict11.com/public/appcast_both.xml';
    // final appCastConfig =
    //     AppcastConfiguration(url: appCastURL, supportedOS: ['android', 'ios']);
    return UpgradeAlert(
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(milliseconds: 500),
        showReleaseNotes: false,
        showIgnore: true,
        canDismissDialog: false,
        showLater: false,
        // appcastConfig: appCastConfig,
        shouldPopScope: () => false,
        minAppVersion: _controller.remoteConfig.getString("min_app_version"),
      ),
      child: HomeScreenWidget(),
    );
  }
}
