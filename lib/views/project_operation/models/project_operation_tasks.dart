// To parse this JSON data, do
//
//     final projectOperationTasksModel = projectOperationTasksModelFromJson(jsonString);

import 'dart:convert';

ProjectOperationTasksModel projectOperationTasksModelFromJson(String str) =>
    ProjectOperationTasksModel.fromJson(json.decode(str));

String projectOperationTasksModelToJson(ProjectOperationTasksModel data) =>
    json.encode(data.toJson());

class ProjectOperationTasksModel {
  ProjectOperationTasksModel({
    required this.data,
  });

  Data data;

  factory ProjectOperationTasksModel.fromJson(Map<String, dynamic> json) =>
      ProjectOperationTasksModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.tasks,
    required this.count,
  });

  List<Task> tasks;
  int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
        "count": count,
      };
}

class Task {
  Task({
    required this.id,
    required this.description,
    required this.name,
    required this.priority,
    required this.assignedToParticipant,
    required this.createdByLeader,
    this.faculty,
    this.startTime,
    this.endTime,
    required this.status,
  });

  int id;
  String description;
  String name;
  int priority;
  AssignedToParticipant assignedToParticipant;
  AssignedToParticipant createdByLeader;
  dynamic faculty;
  dynamic startTime;
  dynamic endTime;
  String status;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        description: json["description"],
        name: json["name"],
        priority: json["priority"],
        assignedToParticipant:
            AssignedToParticipant.fromJson(json["assignedToParticipant"]),
        createdByLeader:
            AssignedToParticipant.fromJson(json["createdByLeader"]),
        faculty: json["faculty"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "name": name,
        "priority": priority,
        "assignedToParticipant": assignedToParticipant.toJson(),
        "createdByLeader": createdByLeader.toJson(),
        "faculty": faculty,
        "startTime": startTime,
        "endTime": endTime,
        "status": status,
      };
}

class AssignedToParticipant {
  AssignedToParticipant({
    required this.id,
    required this.name,
    required this.enrollmentNo,
  });

  int id;
  String name;
  String enrollmentNo;

  factory AssignedToParticipant.fromJson(Map<String, dynamic> json) =>
      AssignedToParticipant(
        id: json["id"],
        name: json["name"],
        enrollmentNo: json["enrollmentNo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "enrollmentNo": enrollmentNo,
      };
}
