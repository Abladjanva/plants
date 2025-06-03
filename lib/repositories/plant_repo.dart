import 'package:plants/models/plants_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlantRepo {
  Future<List<Plant>> fetchPlants() async {
    try {
      final url = Uri.parse('https://api.sampleapis.com/health/professions');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final List<Plant> plants = data.map((e) => Plant.fromJson(e)).toList();
        return plants;
      }
      throw Exception('Xatolik yuz berdi');
    } catch (e) {
      throw Exception(e);
    }
  }
}
