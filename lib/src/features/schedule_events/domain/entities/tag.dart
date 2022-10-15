class Tag {
  Tag({
    required this.id,
    required this.title,
    required this.icon,
  });

  final int id;
  final String title;
  final String icon;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        title: json["title"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title ,
        "icon": icon,
      };
}
