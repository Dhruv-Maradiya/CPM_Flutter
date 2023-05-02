import 'package:flutter/material.dart';
import 'package:projectify/core/constants/string_constants.dart';
import 'package:get/get.dart';
import 'package:projectify/core/constants/routes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        initialRoute: Routes.home,
        // builder: (context, child) => const HomeScreen(),
      ),
    );
  }
}
