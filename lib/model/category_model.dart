class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
