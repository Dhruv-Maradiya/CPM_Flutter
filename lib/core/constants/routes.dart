import 'package:get/get.dart';
import 'package:projectify/views/create_student_account/create_student_account_screen.dart';
import 'package:projectify/views/create_task/create_task_screen.dart';
import 'package:projectify/views/groups/widgets/create_project.dart';
import 'package:projectify/views/home/home_screen.dart';
import 'package:projectify/views/invitations/invitations_screen.dart';
import 'package:projectify/views/privacy_policy/privacy_policy_screen.dart';
import 'package:projectify/views/profile/profile_screen.dart';
import 'package:projectify/views/project_details/project_details_screen.dart';
import 'package:projectify/views/project_operation/project_operation_screen.dart';
import 'package:projectify/views/projects/projects_screen.dart';
import 'package:projectify/views/sign_in_as_faculty/sign_in_as_faculty_screen.dart';
import 'package:projectify/views/sign_in_as_student/sign_in_as_student_screen.dart';
import 'package:projectify/views/groups/groups_screen.dart';
import 'package:projectify/views/splash/splash_screen.dart';
import 'package:projectify/views/task_details/task_details_screen.dart';
import 'package:projectify/views/terms_and_condition/terms_and_condition.dart';

class Routes {
  static const initial = "/";
  static const home = "/home";
  static const projectDetails = "/projectDetails";
  static const studentSignIn = "/auth/signIn/student";
  static const facultySignIn = "/auth/signIn/faculty";
  static const studentRegister = "/auth/signUp/student";
  static const profile = "/profile";
  static const projects = "/projects";
  static const projectOperation = "/projectsOperation";
  static const createTask = "/projectsOperation/createTask";
  static const taskDetails = "/projectsOperation/taskDetails";
  static const groups = "/groups";
  static const createProject = "/groups/createProject";
  static const invitations = "/invitations";
  static const students = "/students";
  static const faculties = "/faculties";
  static const branches = "/branches";
  static const academics = "/academics";
  static const frontEndTechnology = "/frontEndTechnology";
  static const backendTechnology = "/backendTechnology";
  static const databaseTechnology = "/databaseTechnology";
  static const categories = "/categories";
  static const privacyPolicy = "/privacyPolicy";
  static const termsAndCondition = "/termsAndCondition";

  static final getPages = [
    GetPage(
      name: Routes.initial,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
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
      name: Routes.taskDetails,
      page: () => const TaskDetailsScreen(),
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
      name: Routes.projectOperation,
      page: () => const ProjectOperationScreen(),
    ),
    GetPage(
      name: Routes.createTask,
      page: () => const CreateTaskScreen(),
    ),
    GetPage(
      name: Routes.groups,
      page: () => const GroupsScreen(),
    ),
    GetPage(
      name: Routes.createProject,
      page: () => CreateProject(),
    ),
    GetPage(
      name: Routes.invitations,
      page: () => const InvitationScreen(),
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
    GetPage(
      name: Routes.privacyPolicy,
      page: () => PrivacyPolicy(),
    ),
    GetPage(
      name: Routes.termsAndCondition,
      page: () => TermsAndCondition(),
    ),
  ];
}
