import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xml/xml.dart';

import '../../domain/entities/plant_point.dart';
import '../../domain/entities/plot_area.dart';
import '../models/plant_point_model.dart';
import '../models/plot_area_model.dart';

/// Serviço para importação e exportação de dados em diferentes formatos
class ImportExportService {
  /// Importa plantas de um arquivo CSV
  Future<List<PlantPoint>> importPlantsFromCsv(File file) async {
    try {
      final content = await file.readAsString();
      final rows = const CsvToListConverter().convert(content);

      if (rows.isEmpty) {
        throw Exception('Arquivo CSV vazio');
      }

      final headers = rows.first.map((e) => e.toString()).toList();
      final plants = <PlantPoint>[];

      for (var i = 1; i < rows.length; i++) {
        try {
          final row = rows[i].map((e) => e.toString()).toList();
          final plant = PlantPointModel.fromCsv(row, headers);
          plants.add(plant);
        } catch (e) {
          // Ignora linhas inválidas
          continue;
        }
      }

      return plants;
    } catch (e) {
      throw Exception('Erro ao importar CSV: $e');
    }
  }

  /// Exporta plantas para arquivo CSV
  Future<String> exportPlantsToCsv(List<PlantPoint> plants) async {
    final rows = <List<String>>[];
    rows.add(PlantPointModel.csvHeaders());

    for (final plant in plants) {
      final model = PlantPointModel.fromEntity(plant);
      rows.add(model.toCsv());
    }

    return const ListToCsvConverter().convert(rows);
  }

  /// Importa plantas de um arquivo GeoJSON
  Future<List<PlantPoint>> importPlantsFromGeoJson(File file) async {
    try {
      final content = await file.readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;

      final features = json['features'] as List<dynamic>;
      final plants = <PlantPoint>[];

      for (final feature in features) {
        final featureMap = feature as Map<String, dynamic>;
        final geometry = featureMap['geometry'] as Map<String, dynamic>;
        final properties =
            featureMap['properties'] as Map<String, dynamic>? ?? {};

        if (geometry['type'] == 'Point') {
          final coordinates = geometry['coordinates'] as List<dynamic>;
          final plant = PlantPointModel(
            id: properties['id']?.toString() ??
                featureMap['id']?.toString() ??
                DateTime.now().millisecondsSinceEpoch.toString(),
            name: properties['name']?.toString() ?? 'Sem nome',
            latitude: (coordinates[1] as num).toDouble(),
            longitude: (coordinates[0] as num).toDouble(),
            genotype: properties['genotype']?.toString(),
            row: properties['row'] as int?,
            col: properties['col'] as int?,
            health: PlantHealth.fromString(properties['health']?.toString()),
            notes: properties['notes']?.toString(),
            tags: properties['tags'] != null
                ? List<String>.from(properties['tags'] as List<dynamic>)
                : [],
          );
          plants.add(plant);
        }
      }

      return plants;
    } catch (e) {
      throw Exception('Erro ao importar GeoJSON: $e');
    }
  }

  /// Exporta plantas para GeoJSON
  Future<String> exportPlantsToGeoJson(List<PlantPoint> plants) async {
    final features = plants.map((plant) {
      return {
        'type': 'Feature',
        'id': plant.id,
        'geometry': {
          'type': 'Point',
          'coordinates': [plant.longitude, plant.latitude],
        },
        'properties': {
          'name': plant.name,
          if (plant.genotype != null) 'genotype': plant.genotype,
          if (plant.row != null) 'row': plant.row,
          if (plant.col != null) 'col': plant.col,
          'health': plant.health.value,
          if (plant.notes != null) 'notes': plant.notes,
          'tags': plant.tags,
        },
      };
    }).toList();

    final geoJson = {
      'type': 'FeatureCollection',
      'features': features,
    };

    return const JsonEncoder.withIndent('  ').convert(geoJson);
  }

  /// Importa talhões/áreas de um arquivo GeoJSON
  Future<List<PlotArea>> importAreasFromGeoJson(File file) async {
    try {
      final content = await file.readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;

      final features = json['features'] as List<dynamic>;
      final areas = <PlotArea>[];

      for (final feature in features) {
        final featureMap = feature as Map<String, dynamic>;
        final geometry = featureMap['geometry'] as Map<String, dynamic>;

        if (geometry['type'] == 'Polygon') {
          final area = PlotAreaModel.fromGeoJsonFeature(featureMap);
          areas.add(area);
        }
      }

      return areas;
    } catch (e) {
      throw Exception('Erro ao importar áreas GeoJSON: $e');
    }
  }

  /// Exporta áreas para GeoJSON
  Future<String> exportAreasToGeoJson(List<PlotArea> areas) async {
    final features = areas.map((area) {
      final model = PlotAreaModel.fromEntity(area);
      return model.toGeoJsonFeature();
    }).toList();

    final geoJson = {
      'type': 'FeatureCollection',
      'features': features,
    };

    return const JsonEncoder.withIndent('  ').convert(geoJson);
  }

  /// Importa áreas de um arquivo KML
  Future<List<PlotArea>> importAreasFromKml(File file) async {
    try {
      final content = await file.readAsString();
      final document = XmlDocument.parse(content);

      final placemarks = document.findAllElements('Placemark');
      final areas = <PlotArea>[];

      for (final placemark in placemarks) {
        final name = placemark.findElements('name').firstOrNull?.innerText ??
            'Área sem nome';
        final description =
            placemark.findElements('description').firstOrNull?.innerText;

        final coordinates = placemark
            .findAllElements('coordinates')
            .firstOrNull
            ?.innerText
            .trim();

        if (coordinates != null) {
          final points = <LatLng>[];
          final coordList = coordinates.split(RegExp(r'\s+'));

          for (final coord in coordList) {
            if (coord.isEmpty) continue;
            final parts = coord.split(',');
            if (parts.length >= 2) {
              final lng = double.tryParse(parts[0]);
              final lat = double.tryParse(parts[1]);
              if (lng != null && lat != null) {
                points.add(LatLng(lat, lng));
              }
            }
          }

          if (points.isNotEmpty) {
            areas.add(PlotAreaModel(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              name: name,
              polygonPoints: points,
              description: description,
            ));
          }
        }
      }

      return areas;
    } catch (e) {
      throw Exception('Erro ao importar KML: $e');
    }
  }

  /// Exporta trilha para formato GPX
  Future<String> exportTrackToGpx(
    List<LatLng> points,
    String trackName,
    DateTime startTime,
  ) async {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element('gpx', nest: () {
      builder.attribute('version', '1.1');
      builder.attribute('creator', 'Field Map App');

      builder.element('trk', nest: () {
        builder.element('name', nest: trackName);
        builder.element('trkseg', nest: () {
          for (var i = 0; i < points.length; i++) {
            final point = points[i];
            final time = startTime.add(Duration(seconds: i * 5));

            builder.element('trkpt', nest: () {
              builder.attribute('lat', point.latitude.toString());
              builder.attribute('lon', point.longitude.toString());
              builder.element('time', nest: time.toIso8601String());
            });
          }
        });
      });
    });

    return builder.buildDocument().toXmlString(pretty: true);
  }
}
