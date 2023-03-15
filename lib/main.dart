import 'package:projectify/main_controller.dart';
import 'package:projectify/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:projectify/core/constants/string_constants.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.light(),
        title: StringConstants.appName,
        getPages: Routes.getPages,
        builder: (context, child) => const HomeScreen(),
      ),
    );
  }
}
