class MyProjectModel {
  final String? name;
  final String? imageUrl;
  final String? description;
  final String? link;

  MyProjectModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.link,
  });

  factory MyProjectModel.fromJson(Map<String, dynamic> json) {
    return MyProjectModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      link: json['link'],
    );
  }
}
