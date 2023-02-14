// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

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
  });

  List<Project> projects;
  int count;
  bool isUnreadNotifications;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
        count: json["count"],
        isUnreadNotifications: json["isUnreadNotifications"],
      );

  Map<String, dynamic> toJson() => {
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "count": count,
        "isUnreadNotifications": isUnreadNotifications,
      };
}

class Project {
  Project({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.academicId,
    required this.frontendTechnologyId,
    required this.backendTechnologyId,
    required this.databaseTechnologyId,
    required this.groupId,
    required this.description,
    required this.updatedAt,
    required this.createdAt,
    required this.isVerified,
    this.verifiedByFacultyId,
    required this.academic,
    required this.frontendTechnology,
    required this.backendTechnology,
    required this.databaseTechnology,
    required this.media,
    required this.category,
  });

  int id;
  String name;
  int categoryId;
  int academicId;
  int frontendTechnologyId;
  int backendTechnologyId;
  int databaseTechnologyId;
  int groupId;
  String description;
  DateTime updatedAt;
  DateTime createdAt;
  bool isVerified;
  int? verifiedByFacultyId;
  Academic academic;
  Technology frontendTechnology;
  Technology backendTechnology;
  Technology databaseTechnology;
  List<Media> media;
  Category category;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        name: json["name"],
        categoryId: json["categoryId"],
        academicId: json["academicId"],
        frontendTechnologyId: json["frontendTechnologyId"],
        backendTechnologyId: json["backendTechnologyId"],
        databaseTechnologyId: json["databaseTechnologyId"],
        groupId: json["groupId"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        isVerified: json["isVerified"],
        verifiedByFacultyId: json["verifiedByFacultyId"],
        academic: Academic.fromJson(json["academic"]),
        frontendTechnology: Technology.fromJson(json["frontendTechnology"]),
        backendTechnology: Technology.fromJson(json["backendTechnology"]),
        databaseTechnology: Technology.fromJson(json["databaseTechnology"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categoryId": categoryId,
        "academicId": academicId,
        "frontendTechnologyId": frontendTechnologyId,
        "backendTechnologyId": backendTechnologyId,
        "databaseTechnologyId": databaseTechnologyId,
        "groupId": groupId,
        "description": description,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "isVerified": isVerified,
        "verifiedByFacultyId": verifiedByFacultyId,
        "academic": academic.toJson(),
        "frontendTechnology": frontendTechnology.toJson(),
        "backendTechnology": backendTechnology.toJson(),
        "databaseTechnology": databaseTechnology.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "category": category.toJson(),
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
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String logo;
  String description;
  String url;
  DateTime createdAt;
  DateTime updatedAt;

  factory Technology.fromJson(Map<String, dynamic> json) => Technology(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        description: json["description"],
        url: json["url"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "description": description,
        "url": url,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Media {
  Media({
    required this.id,
    required this.name,
    required this.identifier,
    required this.projectId,
    required this.format,
    this.isReviewed,
    this.reviewedBy,
    required this.createdAt,
  });

  int id;
  String name;
  String identifier;
  int projectId;
  String format;
  bool? isReviewed;
  int? reviewedBy;
  DateTime createdAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        name: json["name"],
        identifier: json["identifier"],
        projectId: json["projectId"],
        format: json["format"],
        isReviewed: json["isReviewed"],
        reviewedBy: json["reviewedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "identifier": identifier,
        "projectId": projectId,
        "format": format,
        "isReviewed": isReviewed,
        "reviewedBy": reviewedBy,
        "createdAt": createdAt.toIso8601String(),
      };
}
