class PlantModel {
  final int id;
  final String shortName;
  final String longName;

  PlantModel({required this.id, required this.shortName, required this.longName});

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'],
      shortName: json['short_name'],
      longName: json['long_name'],
    );
  }
}