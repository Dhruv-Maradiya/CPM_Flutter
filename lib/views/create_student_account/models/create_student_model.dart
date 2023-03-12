// To parse this JSON data, do
//
//     final studentCreateModel = studentCreateModelFromJson(jsonString);

import 'dart:convert';

StudentCreateModel studentCreateModelFromJson(String str) =>
    StudentCreateModel.fromJson(json.decode(str));

String studentCreateModelToJson(StudentCreateModel data) =>
    json.encode(data.toJson());

class StudentCreateModel {
  StudentCreateModel({
    required this.data,
  });

  Data data;

  factory StudentCreateModel.fromJson(Map<String, dynamic> json) =>
      StudentCreateModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.student,
  });

  String token;
  Student student;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        student: Student.fromJson(json["student"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "student": student.toJson(),
      };
}

class Student {
  Student({
    required this.id,
    required this.name,
    required this.semester,
    required this.enrollmentNo,
    required this.email,
    required this.number,
  });

  int id;
  String name;
  int semester;
  String enrollmentNo;
  String email;
  String number;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        semester: json["semester"],
        enrollmentNo: json["enrollmentNo"],
        email: json["email"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "semester": semester,
        "enrollmentNo": enrollmentNo,
        "email": email,
        "number": number,
      };
}
