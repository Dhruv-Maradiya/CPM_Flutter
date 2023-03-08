import 'package:projectify/views/home/models/home_screen_model.dart';

class Technologies {
  Technologies({
    required this.data,
  });

  List<Technology> data;

  factory Technologies.fromJson(Map<String, dynamic> json, String stackStr) =>
      Technologies(
        data: Data.fromJson(json["data"], stackStr).stack,
      );
}

class Data {
  Data({
    required this.stack,
    required this.count,
  });

  final List<Technology> stack;
  final int count;

  factory Data.fromJson(Map<String, dynamic> json, String stackStr) => Data(
        stack: List<Technology>.from(
            json[stackStr].map((x) => Technology.fromJson(x))),
        count: json["count"],
      );
}
