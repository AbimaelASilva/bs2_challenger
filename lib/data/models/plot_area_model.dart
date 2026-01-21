import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/plot_area.dart';

/// Modelo de dados para PlotArea com serialização JSON
class PlotAreaModel extends PlotArea {
  const PlotAreaModel({
    required super.id,
    required super.name,
    required super.polygonPoints,
    super.color,
    super.fillColor,
    super.strokeWidth,
    super.description,
  });

  factory PlotAreaModel.fromJson(Map<String, dynamic> json) {
    final coordinates = json['coordinates'] as List<dynamic>;
    final points = coordinates.map((coord) {
      final coordList = coord as List<dynamic>;
      return LatLng(
        (coordList[1] as num).toDouble(), // latitude
        (coordList[0] as num).toDouble(), // longitude (GeoJSON usa lon, lat)
      );
    }).toList();

    return PlotAreaModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ??
          json['properties']?['name'] as String? ??
          '',
      polygonPoints: points,
      color: json['color'] as int?,
      fillColor: json['fillColor'] as int?,
      strokeWidth: (json['strokeWidth'] as num?)?.toDouble() ?? 2.0,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'coordinates': polygonPoints
          .map((point) => [point.longitude, point.latitude])
          .toList(),
      if (color != null) 'color': color,
      if (fillColor != null) 'fillColor': fillColor,
      'strokeWidth': strokeWidth,
      if (description != null) 'description': description,
    };
  }

  /// Cria a partir de GeoJSON Feature
  factory PlotAreaModel.fromGeoJsonFeature(Map<String, dynamic> feature) {
    final geometry = feature['geometry'] as Map<String, dynamic>;
    final properties = feature['properties'] as Map<String, dynamic>?;

    List<LatLng> points = [];

    if (geometry['type'] == 'Polygon') {
      final coordinates = geometry['coordinates'][0] as List<dynamic>;
      points = coordinates.map((coord) {
        final coordList = coord as List<dynamic>;
        return LatLng(
          (coordList[1] as num).toDouble(),
          (coordList[0] as num).toDouble(),
        );
      }).toList();
    }

    return PlotAreaModel(
      id: properties?['id']?.toString() ??
          feature['id']?.toString() ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      name: properties?['name']?.toString() ?? 'Área sem nome',
      polygonPoints: points,
      description: properties?['description']?.toString(),
    );
  }

  /// Converte para GeoJSON Feature
  Map<String, dynamic> toGeoJsonFeature() {
    return {
      'type': 'Feature',
      'id': id,
      'geometry': {
        'type': 'Polygon',
        'coordinates': [
          polygonPoints
              .map((point) => [point.longitude, point.latitude])
              .toList(),
        ],
      },
      'properties': {
        'name': name,
        if (description != null) 'description': description,
      },
    };
  }

  factory PlotAreaModel.fromEntity(PlotArea entity) {
    return PlotAreaModel(
      id: entity.id,
      name: entity.name,
      polygonPoints: entity.polygonPoints,
      color: entity.color,
      fillColor: entity.fillColor,
      strokeWidth: entity.strokeWidth,
      description: entity.description,
    );
  }
}
