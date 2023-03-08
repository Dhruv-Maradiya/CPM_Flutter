// To parse this JSON data, do
//
//     final projectOperationProjectModel = projectOperationProjectModelFromJson(jsonString);

import 'dart:convert';
import 'package:projectify/views/home/models/home_screen_model.dart';

ProjectOperationProjectModel projectOperationProjectModelFromJson(String str) =>
    ProjectOperationProjectModel.fromJson(json.decode(str));

String projectOperationProjectModelToJson(ProjectOperationProjectModel data) =>
    json.encode(data.toJson());

class ProjectOperationProjectModel {
  ProjectOperationProjectModel({
    required this.data,
  });

  final Project data;

  factory ProjectOperationProjectModel.fromJson(Map<String, dynamic> json) =>
      ProjectOperationProjectModel(
        data: Project.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}
