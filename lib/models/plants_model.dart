class Plant {
  final int id;
  final String shortName;
  final String longName;

  Plant({required this.id, required this.shortName, required this.longName});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'] ?? 0,
      shortName: json['short_name'] ?? '',
      longName: json['long_name'] ?? '',
    );
  }
}
