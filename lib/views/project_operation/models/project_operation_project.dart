// To parse this JSON data, do
//
//     final projectOperationProjectModel = projectOperationProjectModelFromJson(jsonString);

import 'dart:convert';

ProjectOperationProjectModel projectOperationProjectModelFromJson(String str) =>
    ProjectOperationProjectModel.fromJson(json.decode(str));

String projectOperationProjectModelToJson(ProjectOperationProjectModel data) =>
    json.encode(data.toJson());

class ProjectOperationProjectModel {
  ProjectOperationProjectModel({
    required this.data,
  });

  Data data;

  factory ProjectOperationProjectModel.fromJson(Map<String, dynamic> json) =>
      ProjectOperationProjectModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.academic,
    required this.category,
    required this.frontendTechnology,
    required this.databaseTechnology,
    required this.backendTechnology,
    required this.isVerified,
    required this.description,
    required this.media,
    required this.group,
  });

  int id;
  String name;
  Academic academic;
  Category category;
  Technology frontendTechnology;
  Technology databaseTechnology;
  Technology backendTechnology;
  bool isVerified;
  String description;
  List<Media> media;
  Group group;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        academic: Academic.fromJson(json["academic"]),
        category: Category.fromJson(json["category"]),
        frontendTechnology: Technology.fromJson(json["frontendTechnology"]),
        databaseTechnology: Technology.fromJson(json["databaseTechnology"]),
        backendTechnology: Technology.fromJson(json["backendTechnology"]),
        isVerified: json["isVerified"],
        description: json["description"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        group: Group.fromJson(json["group"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "academic": academic.toJson(),
        "category": category.toJson(),
        "frontendTechnology": frontendTechnology.toJson(),
        "databaseTechnology": databaseTechnology.toJson(),
        "backendTechnology": backendTechnology.toJson(),
        "isVerified": isVerified,
        "description": description,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "group": group.toJson(),
      };
}

class Academic {
  Academic({
    required this.id,
    required this.sem,
    required this.year,
    required this.maximumGroupMember,
  });

  int id;
  int sem;
  int year;
  int maximumGroupMember;

  factory Academic.fromJson(Map<String, dynamic> json) => Academic(
        id: json["id"],
        sem: json["sem"],
        year: json["year"],
        maximumGroupMember: json["maximumGroupMember"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sem": sem,
        "year": year,
        "maximumGroupMember": maximumGroupMember,
      };
}

class Technology {
  Technology({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
    required this.url,
  });

  int id;
  String name;
  String logo;
  String description;
  String url;

  factory Technology.fromJson(Map<String, dynamic> json) => Technology(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        description: json["description"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "description": description,
        "url": url,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Group {
  Group({
    required this.id,
    required this.name,
    required this.groupParticipants,
  });

  int id;
  String name;
  List<GroupParticipant> groupParticipants;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        groupParticipants: List<GroupParticipant>.from(
            json["groupParticipants"].map((x) => GroupParticipant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "groupParticipants":
            List<dynamic>.from(groupParticipants.map((x) => x.toJson())),
      };
}

class GroupParticipant {
  GroupParticipant({
    required this.id,
    required this.role,
    required this.student,
  });

  int id;
  String role;
  Student student;

  factory GroupParticipant.fromJson(Map<String, dynamic> json) =>
      GroupParticipant(
        id: json["id"],
        role: json["role"],
        student: Student.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "student": student.toJson(),
      };
}

class Student {
  Student({
    required this.id,
    required this.name,
    required this.enrollmentNo,
  });

  int id;
  String name;
  String enrollmentNo;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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

class Media {
  Media({
    required this.id,
    required this.format,
    required this.identifier,
    required this.name,
  });

  int id;
  String format;
  String identifier;
  String name;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        format: json["format"],
        identifier: json["identifier"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "format": format,
        "identifier": identifier,
        "name": name,
      };
}
