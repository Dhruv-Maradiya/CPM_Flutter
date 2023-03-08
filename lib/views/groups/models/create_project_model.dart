// To parse this JSON data, do
//
//     final createProjectModel = createProjectModelFromJson(jsonString);

import 'dart:convert';

import 'package:projectify/views/home/models/home_screen_model.dart';

CreateProjectModel createProjectModelFromJson(String str) =>
    CreateProjectModel.fromJson(json.decode(str));

String createProjectModelToJson(CreateProjectModel data) =>
    json.encode(data.toJson());

class CreateProjectModel {
  CreateProjectModel({
    required this.data,
  });

  final Data data;

  factory CreateProjectModel.fromJson(Map<String, dynamic> json) =>
      CreateProjectModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.project,
  });

  final Project project;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        project: Project.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "project": project.toJson(),
      };
}
