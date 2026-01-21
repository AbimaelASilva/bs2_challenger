import '../../domain/entities/location_entity.dart';
import 'coordinates_model.dart';
import 'street_model.dart';
import 'timezone_model.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.street,
    required super.city,
    required super.state,
    required super.country,
    required super.postcode,
    required super.coordinates,
    required super.timezone,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      street:
          StreetModel.fromJson(json['street'] as Map<String, dynamic>? ?? {}),
      city: json['city']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      country: json['country']?.toString() ?? '',
      postcode: json['postcode'],
      coordinates: CoordinatesModel.fromJson(
          json['coordinates'] as Map<String, dynamic>? ?? {}),
      timezone: TimezoneModel.fromJson(
          json['timezone'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': (street as StreetModel).toJson(),
      'city': city,
      'state': state,
      'country': country,
      'postcode': postcode,
      'coordinates': (coordinates as CoordinatesModel).toJson(),
      'timezone': (timezone as TimezoneModel).toJson(),
    };
  }

  factory LocationModel.fromEntity(LocationEntity entity) {
    return LocationModel(
      street: StreetModel.fromEntity(entity.street),
      city: entity.city,
      state: entity.state,
      country: entity.country,
      postcode: entity.postcode,
      coordinates: CoordinatesModel.fromEntity(entity.coordinates),
      timezone: TimezoneModel.fromEntity(entity.timezone),
    );
  }

  LocationEntity toEntity() {
    return LocationEntity(
      street: (street as StreetModel).toEntity(),
      city: city,
      state: state,
      country: country,
      postcode: postcode,
      coordinates: (coordinates as CoordinatesModel).toEntity(),
      timezone: (timezone as TimezoneModel).toEntity(),
    );
  }
}
