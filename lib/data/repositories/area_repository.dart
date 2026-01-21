import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/plot_area.dart';
import '../models/plot_area_model.dart';

/// Repositório para gerenciar áreas/talhões
class AreaRepository {
  static const String _areasKey = 'areas_data';

  final SharedPreferences _prefs;

  AreaRepository(this._prefs);

  /// Salva todas as áreas no armazenamento local
  Future<void> saveAreas(List<PlotArea> areas) async {
    final models = areas.map((a) => PlotAreaModel.fromEntity(a)).toList();
    final jsonList = models.map((m) => m.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _prefs.setString(_areasKey, jsonString);
  }

  /// Carrega todas as áreas do armazenamento local
  Future<List<PlotArea>> loadAreas() async {
    final jsonString = _prefs.getString(_areasKey);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList
          .map((json) => PlotAreaModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Adiciona uma nova área
  Future<void> addArea(PlotArea area) async {
    final areas = await loadAreas();
    areas.add(area);
    await saveAreas(areas);
  }

  /// Atualiza uma área existente
  Future<void> updateArea(PlotArea area) async {
    final areas = await loadAreas();
    final index = areas.indexWhere((a) => a.id == area.id);
    if (index != -1) {
      areas[index] = area;
      await saveAreas(areas);
    }
  }

  /// Remove uma área
  Future<void> deleteArea(String areaId) async {
    final areas = await loadAreas();
    areas.removeWhere((a) => a.id == areaId);
    await saveAreas(areas);
  }

  /// Busca uma área por ID
  Future<PlotArea?> getAreaById(String id) async {
    final areas = await loadAreas();
    try {
      return areas.firstWhere((a) => a.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Limpa todas as áreas
  Future<void> clearAreas() async {
    await _prefs.remove(_areasKey);
  }

  /// Importa áreas (substitui todas existentes)
  Future<void> importAreas(List<PlotArea> areas) async {
    await saveAreas(areas);
  }

  /// Importa áreas (adiciona às existentes)
  Future<void> importAreasAdditive(List<PlotArea> newAreas) async {
    final existingAreas = await loadAreas();
    final allAreas = [...existingAreas];

    for (final area in newAreas) {
      final index = allAreas.indexWhere((a) => a.id == area.id);
      if (index != -1) {
        allAreas[index] = area;
      } else {
        allAreas.add(area);
      }
    }

    await saveAreas(allAreas);
  }
}
