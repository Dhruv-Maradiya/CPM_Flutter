// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

import 'package:projectify/rest/rest_constants.dart';

HomeScreenModel homeScreenModelFromJson(String str) =>
    HomeScreenModel.fromJson(json.decode(str));

String homeScreenModelToJson(HomeScreenModel data) =>
    json.encode(data.toJson());

class HomeScreenModel {
  HomeScreenModel({
    required this.data,
  });

  Data data;

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenModel(
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
    required this.isUnreadNotifications,
    required this.categories,
  });

  List<Project> projects;
  int count;
  bool isUnreadNotifications;
  Categories categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
        count: json["count"],
        isUnreadNotifications: json["isUnreadNotifications"],
        categories: Categories.fromJson(json["categories"]),
      );

  Map<String, dynamic> toJson() => {
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "count": count,
        "isUnreadNotifications": isUnreadNotifications,
        "categories": categories.toJson(),
      };
}

class Categories {
  Categories({
    required this.categories,
    required this.count,
  });

  List<Category> categories;
  int count;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "count": count,
      };
}

class Project {
  Project({
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
    required this.projectGuideMapping,
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
  List<ProjectGuideMapping> projectGuideMapping;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
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
        projectGuideMapping: List<ProjectGuideMapping>.from(
            json["projectGuideMapping"]
                .map((x) => ProjectGuideMapping.fromJson(x))),
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
        "projectGuideMapping":
            List<dynamic>.from(projectGuideMapping.map((x) => x.toJson())),
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
    required this.logoUrl,
  });

  int id;
  String name;
  String logo;
  String description;
  String url;
  String logoUrl;

  factory Technology.fromJson(Map<String, dynamic> json) => Technology(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        description: json["description"],
        url: json["url"],
        logoUrl: "${RestConstants.public}/images/${json['logo']}",
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
    required this.profilePicture,
    required this.branch,
    required this.url,
  });

  int id;
  String name;
  String enrollmentNo;
  String profilePicture;
  Branch branch;
  String url;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        enrollmentNo: json["enrollmentNo"],
        profilePicture: json["profilePicture"],
        branch: Branch.fromJson(json["branch"]),
        url: "${RestConstants.public}/images/${json['profilePicture']}",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "enrollmentNo": enrollmentNo,
        "profilePicture": profilePicture,
        "branch": branch.toJson(),
      };
}

class Branch {
  Branch({
    required this.name,
    required this.displayName,
    required this.id,
  });

  String name;
  String displayName;
  int id;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        name: json["name"],
        displayName: json["displayName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "displayName": displayName,
        "id": id,
      };
}

class Media {
  Media({
    required this.id,
    required this.format,
    required this.identifier,
    required this.name,
    required this.url,
  });

  int id;
  String format;
  String identifier;
  String name;
  String url;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        format: json["format"],
        identifier: json["identifier"],
        name: json["name"],
        url: "${RestConstants.public}/images/${json['identifier']}",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "format": format,
        "identifier": identifier,
        "name": name,
      };
}

class ProjectGuideMapping {
  ProjectGuideMapping({
    required this.id,
    required this.faculty,
  });

  int id;
  Faculty faculty;

  factory ProjectGuideMapping.fromJson(Map<String, dynamic> json) =>
      ProjectGuideMapping(
        id: json["id"],
        faculty: Faculty.fromJson(json["faculty"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "faculty": faculty.toJson(),
      };
}

class Faculty {
  Faculty({
    required this.name,
    required this.employeeId,
    required this.profilePicture,
    required this.url,
  });

  String name;
  String employeeId;
  String profilePicture;
  String url;

  factory Faculty.fromJson(Map<String, dynamic> json) => Faculty(
        name: json["name"],
        employeeId: json["employeeId"],
        profilePicture: json["profilePicture"],
        url: "${RestConstants.public}/images/${json['profilePicture']}",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "employeeId": employeeId,
        "profilePicture": profilePicture,
      };
}
