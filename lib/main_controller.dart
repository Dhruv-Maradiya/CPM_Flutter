import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  @override
  void onInit() async {
    super.onInit();

    WidgetsFlutterBinding.ensureInitialized();

    // Firebase
    await Firebase.initializeApp();
  }

  // Firebase Remote Config Method
  setupRemoteConfig() async {
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 1),
      ));
      await remoteConfig.fetchAndActivate();
      RemoteConfigValue(null, ValueSource.valueStatic);
    } catch (e) {
      print("error: $e");
    }
  }
}
