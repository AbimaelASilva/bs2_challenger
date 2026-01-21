import 'coordinates_entity.dart';
import 'street_entity.dart';
import 'timezone_entity.dart';

class LocationEntity {
  final StreetEntity street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final CoordinatesEntity coordinates;
  final TimezoneEntity timezone;

  const LocationEntity({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  LocationEntity.empty()
      : street = StreetEntity.empty(),
        city = '',
        state = '',
        country = '',
        postcode = '',
        coordinates = CoordinatesEntity.empty(),
        timezone = TimezoneEntity.empty();

  LocationEntity copyWith({
    StreetEntity? street,
    String? city,
    String? state,
    String? country,
    dynamic postcode,
    CoordinatesEntity? coordinates,
    TimezoneEntity? timezone,
  }) {
    return LocationEntity(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postcode: postcode ?? this.postcode,
      coordinates: coordinates ?? this.coordinates,
      timezone: timezone ?? this.timezone,
    );
  }
}
