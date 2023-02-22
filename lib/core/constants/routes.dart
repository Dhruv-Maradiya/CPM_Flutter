import 'package:get/get.dart';
import 'package:projectify/views/create_student_account/create_student_account_screen.dart';
import 'package:projectify/views/home/home_screen.dart';
import 'package:projectify/views/profile/profile_screen.dart';
import 'package:projectify/views/project_details/project_details_screen.dart';
import 'package:projectify/views/projects/projects_screen.dart';
import 'package:projectify/views/sign_in_as_faculty/sign_in_as_faculty_screen.dart';
import 'package:projectify/views/sign_in_as_student/sign_in_as_student_screen.dart';

class Routes {
  static const home = "/home";
  static const projectDetails = "/projectDetails";
  static const studentSignIn = "/auth/signIn/student";
  static const facultySignIn = "/auth/signIn/faculty";
  static const studentRegister = "/auth/signUp/student";
  static const profile = "/profile";
  static const projects = "/projects";
  static const groups = "/groups";
  static const students = "/students";
  static const faculties = "/faculties";
  static const branches = "/branches";
  static const academics = "/academics";
  static const frontEndTechnology = "/frontEndTechnology";
  static const backendTechnology = "/backendTechnology";
  static const databaseTechnology = "/databaseTechnology";
  static const categories = "/categories";

  static final getPages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.projectDetails,
      page: () => const ProjectDetailsScreen(),
    ),
    GetPage(
      name: Routes.studentSignIn,
      page: () => const SignInAsStudentScreen(),
    ),
    GetPage(
      name: Routes.facultySignIn,
      page: () => const SignInAsFacultyScreen(),
    ),
    GetPage(
      name: Routes.studentRegister,
      page: () => const CreateStudentAccountScreen(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.projects,
      page: () => const ProjectsScreen(),
    ),
    GetPage(
      name: Routes.groups,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.students,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.faculties,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.branches,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.academics,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.frontEndTechnology,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.backendTechnology,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.databaseTechnology,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.categories,
      page: () => const ProfileScreen(),
    ),
  ];
}
