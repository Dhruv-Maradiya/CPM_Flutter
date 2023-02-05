class ApiResponseModel {
  ApiResponseModel({
    required this.success,
    this.data,
    this.error,
  });

  final bool success;
  final dynamic data;
  final dynamic error;
}

class ApiErrorModel {
  ApiErrorModel({
    required this.status,
    required this.name,
    required this.message,
  });

  final String status;
  final String name;
  final String message;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        status: json["status"],
        name: json["name"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
        "message": message,
      };
}
