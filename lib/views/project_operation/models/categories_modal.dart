import 'package:projectify/views/home/models/home_screen_model.dart'
    as home_screen_modal;

class Categories {
  Categories({
    required this.data,
  });

  List<home_screen_modal.Category> data;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        data: Data.fromJson(json["data"]).categories,
      );
}

class Data {
  Data({
    required this.categories,
    required this.count,
  });

  final List<home_screen_modal.Category> categories;
  final int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: List<home_screen_modal.Category>.from(json["categories"]
            .map((x) => home_screen_modal.Category.fromJson(x))),
        count: json["count"],
      );
}
