class RestConstants {
  static String apiAccessURLLocal = "http://localhost:3000/api";
  static String baseURL = "https://mypredict11.com/";

  /// Auth related API's urls
  static String studentSignIn = "$baseURL/v1/student/login";
  static String studentSignUpIn = "$baseURL/v1/student/create";
  static String facultySignIn = "$baseURL/v1/faculty/login";

  // Branch related API's urls
  static String branchFindMany = "$baseURL/v1/branch/findMany";
}
