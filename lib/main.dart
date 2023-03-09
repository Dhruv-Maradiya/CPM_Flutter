import 'package:projectify/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:projectify/core/constants/string_constants.dart';
import 'package:get/route_manager.dart';
import 'package:projectify/core/constants/routes.dart';
import 'package:projectify/views/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        // FocusScopeNode currentFocus = FocusScope.of(context);

        // // if (!currentFocus.hasPrimaryFocus) {
        // currentFocus.unfocus();
        // // }

        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.light(),
        title: StringConstants.appName,
        getPages: Routes.getPages,
        initialRoute: Routes.initial,
      ),
    );
  }
}
