class RestConstants {
  static String baseURL = "http://193.168.195.86:3002/api";
  // static String baseURL = "http://192.168.1.15:3002/api";
  // static String baseURL = "https://mypredict11.com";

  /// Auth related API's urls
  static String studentSignIn = "$baseURL/v1/student/login";
  static String studentSignUpIn = "$baseURL/v1/student/create";
  static String facultySignIn = "$baseURL/v1/faculty/login";

  // Branch related API's urls
  static String branchFindMany = "$baseURL/v1/branch/findMany";
}
