// To parse this JSON data, do
//
//     final GroupDetails = GroupDetailsFromJson(jsonString);

import 'dart:convert';

GroupDetails groupDetailsFromJson(String str) =>
    GroupDetails.fromJson(json.decode(str));

String groupDetailsToJson(GroupDetails data) => json.encode(data.toJson());

class GroupDetails {
  GroupDetails({
    required this.data,
  });

  final Data data;

  factory GroupDetails.fromJson(Map<String, dynamic> json) => GroupDetails(
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
    required this.groupParticipants,
  });

  final int id;
  final String name;
  final Academic academic;
  final List<GroupParticipant> groupParticipants;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        academic: Academic.fromJson(json["academic"]),
        groupParticipants: List<GroupParticipant>.from(
            json["groupParticipants"].map((x) => GroupParticipant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "academic": academic.toJson(),
        "groupParticipants":
            List<dynamic>.from(groupParticipants.map((x) => x.toJson())),
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
