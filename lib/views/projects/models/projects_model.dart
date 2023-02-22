// To parse this JSON data, do
//
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

import 'package:projectify/views/home/models/home_screen_model.dart'
    show Project;

ProjectsModel projectsFromJson(String str) =>
    ProjectsModel.fromJson(json.decode(str));

String projectsToJson(ProjectsModel data) => json.encode(data.toJson());

class ProjectsModel {
  ProjectsModel({
    required this.data,
  });

  Data data;

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.projects,
    required this.count,
  });

  List<Project> projects;
  int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "count": count,
      };
}
