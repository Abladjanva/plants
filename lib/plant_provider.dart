import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plants/models/plants_model.dart';
import 'dart:convert';
import '../model/plants_model.dart'; // or wherever you place it

class PlantProvider with ChangeNotifier {
  List<PlantModel> _plants = [];
  Set<int> _favorites = {};

  List<PlantModel> get plants => _plants;
  Set<int> get favorites => _favorites;

  Future<void> fetchPlants() async {
    final url = Uri.parse('https://api.sampleapis.com/health/professions');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List decoded = json.decode(response.body);
      _plants = decoded
          .take(4)
          .map((json) => PlantModel.fromJson(json))
          .toList();
      notifyListeners();
    }
  }

  void toggleFavorite(int id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }

  bool isFavorite(int id) => _favorites.contains(id);
}