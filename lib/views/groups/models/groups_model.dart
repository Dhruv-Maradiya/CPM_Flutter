// To parse this JSON data, do
//
//     final groupsModel = groupsModelFromJson(jsonString);

import 'dart:convert';

import 'package:projectify/views/home/models/home_screen_model.dart';

GroupsModel groupsModelFromJson(String str) =>
    GroupsModel.fromJson(json.decode(str));

String groupsModelToJson(GroupsModel data) => json.encode(data.toJson());

class GroupsModel {
  GroupsModel({
    required this.data,
  });

  final Data data;

  factory GroupsModel.fromJson(Map<String, dynamic> json) => GroupsModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.groups,
    required this.count,
  });

  final List<Group> groups;
  final int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
        "count": count,
      };
}

class Group {
  Group({
    required this.id,
    required this.name,
    required this.academic,
    required this.groupParticipants,
    required this.projects,
  });

  final int id;
  final String name;
  final Academic academic;
  final List<GroupParticipant> groupParticipants;
  Project? projects;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        academic: Academic.fromJson(json["academic"]),
        groupParticipants: List<GroupParticipant>.from(
            json["groupParticipants"].map((x) => GroupParticipant.fromJson(x))),
        projects: json["projects"] == null
            ? null
            : Project.fromJson(json["projects"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "academic": academic.toJson(),
        "groupParticipants":
            List<dynamic>.from(groupParticipants.map((x) => x.toJson())),
        "projects": projects?.toJson(),
      };
}

class Academic {
  Academic({
    required this.id,
    required this.year,
    required this.sem,
  });

  final int id;
  final int year;
  final int sem;

  factory Academic.fromJson(Map<String, dynamic> json) => Academic(
        id: json["id"],
        year: json["year"],
        sem: json["sem"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "year": year,
        "sem": sem,
      };
}

class GroupParticipant {
  GroupParticipant({
    required this.id,
    required this.role,
    required this.semester,
    required this.student,
  });

  final int id;
  final String role;
  final int semester;
  final Student student;

  factory GroupParticipant.fromJson(Map<String, dynamic> json) =>
      GroupParticipant(
        id: json["id"],
        role: json["role"],
        semester: json["semester"],
        student: Student.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "semester": semester,
        "student": student.toJson(),
      };
}

class Student {
  Student({
    required this.id,
    required this.enrollmentNo,
    required this.name,
  });

  final int id;
  final String enrollmentNo;
  final String name;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        enrollmentNo: json["enrollmentNo"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "enrollmentNo": enrollmentNo,
        "name": name,
      };
}
