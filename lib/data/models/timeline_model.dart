class TimelineModel {
  final String dateTime;
  final String description;

  TimelineModel({
    required this.dateTime,
    required this.description,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) {
    return TimelineModel(
      dateTime: json['dateTime'],
      description: json['description'],
    );
  }
}
