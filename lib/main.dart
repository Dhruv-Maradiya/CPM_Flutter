import 'package:flutter/material.dart';
import 'package:untitled4/core/constants/string_constants.dart';
import 'package:untitled4/views/sign_in_as_student/sign_in_as_student_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.light(),
      title: StringConstants.appName,
      home: const SignInAsStudentScreen(),
    );
  }
}
