import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/plant_point.dart';
import '../models/plant_point_model.dart';

/// Repositório para gerenciar plantas
class PlantRepository {
  static const String _plantsKey = 'plants_data';

  final SharedPreferences _prefs;

  PlantRepository(this._prefs);

  /// Salva todas as plantas no armazenamento local
  Future<void> savePlants(List<PlantPoint> plants) async {
    final models = plants.map((p) => PlantPointModel.fromEntity(p)).toList();
    final jsonList = models.map((m) => m.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString(_plantsKey, jsonString);
  }

  /// Carrega todas as plantas do armazenamento local
  Future<List<PlantPoint>> loadPlants() async {
    final jsonString = _prefs.getString(_plantsKey);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList
          .map((json) => PlantPointModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Adiciona uma nova planta
  Future<void> addPlant(PlantPoint plant) async {
    final plants = await loadPlants();
    plants.add(plant);
    await savePlants(plants);
  }

  /// Atualiza uma planta existente
  Future<void> updatePlant(PlantPoint plant) async {
    final plants = await loadPlants();
    final index = plants.indexWhere((p) => p.id == plant.id);
    if (index != -1) {
      plants[index] = plant;
      await savePlants(plants);
    }
  }

  /// Remove uma planta
  Future<void> deletePlant(String plantId) async {
    final plants = await loadPlants();
    plants.removeWhere((p) => p.id == plantId);
    await savePlants(plants);
  }

  /// Busca uma planta por ID
  Future<PlantPoint?> getPlantById(String id) async {
    final plants = await loadPlants();
    try {
      return plants.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Busca plantas por tag
  Future<List<PlantPoint>> getPlantsByTag(String tag) async {
    final plants = await loadPlants();
    return plants.where((p) => p.tags.contains(tag)).toList();
  }

  /// Limpa todas as plantas
  Future<void> clearPlants() async {
    await _prefs.remove(_plantsKey);
  }

  /// Importa plantas (substitui todas existentes)
  Future<void> importPlants(List<PlantPoint> plants) async {
    await savePlants(plants);
  }

  /// Importa plantas (adiciona às existentes)
  Future<void> importPlantsAdditive(List<PlantPoint> newPlants) async {
    final existingPlants = await loadPlants();
    final allPlants = [...existingPlants];

    for (final plant in newPlants) {
      final index = allPlants.indexWhere((p) => p.id == plant.id);
      if (index != -1) {
        allPlants[index] = plant; // Atualiza se já existe
      } else {
        allPlants.add(plant); // Adiciona se não existe
      }
    }

    await savePlants(allPlants);
  }
}
