class GameModel {
  GameModel({
    required this.id,
    required this.title,
    required this.creation,
    required this.featured,
    required this.height,
    required this.width,
    required this.orientation,
    required this.responsive,
    required this.author,
    required this.rkScore,
    required this.rks,
    required this.thumbnailUrl,
    required this.thumbnailUrl100,
    required this.url,
    required this.touch,
    required this.hwcontrols,
    required this.lastUpdate,
    required this.description,
    required this.category,
    required this.categories,
    required this.descIt,
    required this.descEn,
    required this.descFr,
    required this.descDe,
    required this.descEs,
    required this.minAndroidVersion,
    required this.minIosVersion,
    required this.minWpVersion,
    required this.approvalDate,
  });

  String id;
  String title;
  DateTime creation;
  bool featured;
  int height;
  int width;
  String orientation;
  bool responsive;
  String author;
  double rkScore;
  double rks;
  String thumbnailUrl;
  String thumbnailUrl100;
  String url;
  bool touch;
  bool hwcontrols;
  DateTime lastUpdate;
  String description;
  String category;
  List<String> categories;
  String descIt;
  String descEn;
  String descFr;
  String descDe;
  String descEs;
  double minAndroidVersion;
  int minIosVersion;
  int minWpVersion;
  DateTime approvalDate;

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json["id"],
      title: json["title"],
      creation: DateTime.parse(json["creation"]),
      featured: json["featured"],
      height: json["height"],
      width: json["width"],
      orientation: json["orientation"],
      responsive: json["responsive"],
      author: json["author"],
      rkScore: json["rkScore"].toDouble(),
      rks: json["rks"].toDouble(),
      thumbnailUrl: json["thumbnailUrl"],
      thumbnailUrl100: json["thumbnailUrl100"],
      url: json["url"],
      touch: json["touch"],
      hwcontrols: json["hwcontrols"],
      lastUpdate: DateTime.parse(json["lastUpdate"]),
      description: json["description"],
      category: json["category"],
      categories: List<String>.from(json["categories"].map((x) => x)),
      descIt: json["desc_it"],
      descEn: json["desc_en"],
      descFr: json["desc_fr"],
      descDe: json["desc_de"],
      descEs: json["desc_es"],
      minAndroidVersion: json["min_android_version"].toDouble(),
      minIosVersion: json["min_ios_version"],
      minWpVersion: json["min_wp_version"],
      approvalDate: DateTime.parse(json["approval_date"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "creation": creation.toIso8601String(),
        "featured": featured,
        "height": height,
        "width": width,
        "orientation": orientation,
        "responsive": responsive,
        "author": author,
        "rkScore": rkScore,
        "rks": rks,
        "thumbnailUrl": thumbnailUrl,
        "thumbnailUrl100": thumbnailUrl100,
        "url": url,
        "touch": touch,
        "hwcontrols": hwcontrols,
        "lastUpdate": lastUpdate.toIso8601String(),
        "description": description,
        "category": category,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "desc_it": descIt,
        "desc_en": descEn,
        "desc_fr": descFr,
        "desc_de": descDe,
        "desc_es": descEs,
        "min_android_version": minAndroidVersion,
        "min_ios_version": minIosVersion,
        "min_wp_version": minWpVersion,
        "approval_date": approvalDate.toIso8601String(),
      };
}
