import 'package:cpm/preference/shared_preference.dart';
import 'package:cpm/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cpm/core/constants/string_constants.dart';
import 'package:cpm/views/sign_in_as_student/sign_in_as_student_screen.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.light(),
        title: StringConstants.appName,
        home: FutureBuilder(
            future: SharedPreferencesClass.getSharePreference(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  return const HomeScreen();
                }
              }
              return const SignInAsStudentScreen();
            }));
  }
}
