class Project {
  Project({
    required this.title,
    required this.desc,
  });

  final String title;
  final String desc;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        title: json["title"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
      };
}
