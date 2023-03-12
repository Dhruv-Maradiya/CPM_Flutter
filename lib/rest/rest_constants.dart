class RestConstants {
  static String baseURL = "http://193.168.195.86:3002/api";
  // static String baseURL = "http://192.168.1.4:3002/api";
  static String public = "http://193.168.195.86:3002/public";
  // static String baseURL = "http://192.168.1.15:3002/api";
  // static String baseURL = "https://mypredict11.com";

  /// Auth related API's urls
  static String studentSignIn = "$baseURL/v1/student/login";
  static String studentSignUp = "$baseURL/v1/student";
  static String facultySignIn = "$baseURL/v1/faculty/login";

  // Branch related API's urls
  static String branchFindMany = "$baseURL/v1/branch/findMany";
  static String findManyProjectsByStudent =
      "$baseURL/v1/project/findManyByStudent";

  static String homeScreen = "$baseURL/v1/home";
  static String findOneProject = "$baseURL/v1/project/find";

  static String studentProfile = "$baseURL/v1/student/find";
  static String facultyProfile = "$baseURL/v1/faculty/find";
  static String studentProfileUpdate = "$baseURL/v1/student";
  static String facultyProfileUpdate = "$baseURL/v1/faculty";

  static String projectTasksFetch = "$baseURL/v1/task/findManyByProject";
  static String tasksUpdate = "$baseURL/v1/task";
  static String projectTasksCreate = "$baseURL/v1/task";

  static String fetchGroup = "$baseURL/v1/group/find";
  static String fetchMyGroup = "$baseURL/v1/group/findMy";

  static String createProject = "$baseURL/v1/project";

  static String invite = "$baseURL/v1/invitationForGroup";

  static String fetchInviteStudents = "$baseURL/v1/student/findManyForInvite";
  // Technologies
  static String fetchFrontendTechnologies =
      "$baseURL/v1/frontendTechnology/findMany";
  static String fetchBackendTechnologies =
      "$baseURL/v1/backendTechnology/findMany";
  static String fetchDatabaseTechnologies =
      "$baseURL/v1/databaseTechnology/findMany";
  static String fetchCategories = "$baseURL/v1/category/findMany";

  static String receivedInvitations =
      "$baseURL/v1/invitationForGroup/findManyByStudentReceived";
  static String sentInvitations =
      "$baseURL/v1/invitationForGroup/findManyByLeader";
  static String updateInvitation =
      "$baseURL/v1/invitationForGroup/updateStatus";
}
