import 'package:flutter/material.dart';
import 'package:plants/models/plants_model.dart';
import 'package:plants/repositories/plant_repo.dart';

class PlantProvider with ChangeNotifier {
  final List<Plant> _plants = [];
  String? _error;
  bool _isLoading = false;

  Set<int> _favorites = {};

  List<Plant> get plants => _plants;
  Set<int> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPlants() async {
    _isLoading = true;
    notifyListeners();
    try {
      final result = await PlantRepo().fetchPlants();
      _plants.addAll(result);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
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
