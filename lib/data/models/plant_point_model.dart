import '../../domain/entities/plant_point.dart';

/// Modelo de dados para PlantPoint com serialização JSON
class PlantPointModel extends PlantPoint {
  const PlantPointModel({
    required super.id,
    required super.name,
    required super.latitude,
    required super.longitude,
    super.genotype,
    super.row,
    super.col,
    super.health,
    super.notes,
    super.lastSeenUtc,
    super.tags,
    super.photos,
  });

  factory PlantPointModel.fromJson(Map<String, dynamic> json) {
    return PlantPointModel(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      genotype: json['genotype'] as String?,
      row: json['row'] as int?,
      col: json['col'] as int?,
      health: PlantHealth.fromString(json['health'] as String?),
      notes: json['notes'] as String?,
      lastSeenUtc: json['last_seen_utc'] != null
          ? DateTime.parse(json['last_seen_utc'] as String)
          : null,
      tags: json['tags'] != null
          ? List<String>.from(json['tags'] as List<dynamic>)
          : [],
      photos: json['photos'] != null
          ? List<String>.from(json['photos'] as List<dynamic>)
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      if (genotype != null) 'genotype': genotype,
      if (row != null) 'row': row,
      if (col != null) 'col': col,
      'health': health.value,
      if (notes != null) 'notes': notes,
      if (lastSeenUtc != null) 'last_seen_utc': lastSeenUtc!.toIso8601String(),
      'tags': tags,
      'photos': photos,
    };
  }

  factory PlantPointModel.fromEntity(PlantPoint entity) {
    return PlantPointModel(
      id: entity.id,
      name: entity.name,
      latitude: entity.latitude,
      longitude: entity.longitude,
      genotype: entity.genotype,
      row: entity.row,
      col: entity.col,
      health: entity.health,
      notes: entity.notes,
      lastSeenUtc: entity.lastSeenUtc,
      tags: entity.tags,
      photos: entity.photos,
    );
  }

  /// Cria a partir de uma linha CSV
  factory PlantPointModel.fromCsv(List<String> row, List<String> headers) {
    final data = <String, String>{};
    for (var i = 0; i < headers.length && i < row.length; i++) {
      data[headers[i].toLowerCase().trim()] = row[i].trim();
    }

    return PlantPointModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      latitude: double.tryParse(data['latitude'] ?? '') ?? 0.0,
      longitude: double.tryParse(data['longitude'] ?? '') ?? 0.0,
      genotype: data['genotype'],
      row: int.tryParse(data['row'] ?? ''),
      col: int.tryParse(data['col'] ?? ''),
      health: PlantHealth.fromString(data['health']),
      notes: data['notes'],
      tags: data['tags']?.split(';').map((e) => e.trim()).toList() ?? [],
    );
  }

  /// Converte para linha CSV
  List<String> toCsv() {
    return [
      id,
      name,
      genotype ?? '',
      row?.toString() ?? '',
      col?.toString() ?? '',
      latitude.toString(),
      longitude.toString(),
      health.value,
      notes ?? '',
      tags.join(';'),
    ];
  }

  static List<String> csvHeaders() {
    return [
      'id',
      'name',
      'genotype',
      'row',
      'col',
      'latitude',
      'longitude',
      'health',
      'notes',
      'tags',
    ];
  }
}
