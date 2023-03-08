// To parse this JSON data, do
//
//     final invitationModel = invitationModelFromJson(jsonString);

import 'dart:convert';

InvitationModel invitationModelFromJson(String str) =>
    InvitationModel.fromJson(json.decode(str));

String invitationModelToJson(InvitationModel data) =>
    json.encode(data.toJson());

class InvitationModel {
  InvitationModel({
    required this.data,
  });

  final Data data;

  factory InvitationModel.fromJson(Map<String, dynamic> json) =>
      InvitationModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.invitationForGroup,
    required this.count,
  });

  final List<InvitationForGroup> invitationForGroup;
  final int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        invitationForGroup: List<InvitationForGroup>.from(
            json["invitationForGroup"]
                .map((x) => InvitationForGroup.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "invitationForGroup":
            List<dynamic>.from(invitationForGroup.map((x) => x.toJson())),
        "count": count,
      };
}

class InvitationForGroup {
  InvitationForGroup({
    required this.id,
    required this.group,
    required this.groupLeader,
    required this.member,
    required this.status,
  });

  final int id;
  final Group group;
  final GroupLeader groupLeader;
  final GroupLeader member;
  final String status;

  factory InvitationForGroup.fromJson(Map<String, dynamic> json) =>
      InvitationForGroup(
        id: json["id"],
        group: Group.fromJson(json["group"]),
        groupLeader: GroupLeader.fromJson(json["groupLeader"]),
        member: GroupLeader.fromJson(json["member"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group": group.toJson(),
        "groupLeader": groupLeader.toJson(),
        "member": member.toJson(),
        "status": status,
      };
}

class Group {
  Group({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class GroupLeader {
  GroupLeader({
    required this.id,
    required this.name,
    required this.enrollmentNo,
  });

  final int id;
  final String name;
  final String enrollmentNo;

  factory GroupLeader.fromJson(Map<String, dynamic> json) => GroupLeader(
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
