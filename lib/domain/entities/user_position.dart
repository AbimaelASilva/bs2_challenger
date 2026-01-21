import 'package:equatable/equatable.dart';

/// Entidade que representa a posição atual do usuário
class UserPosition extends Equatable {
  const UserPosition({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    this.altitude,
    this.heading,
    this.speed,
    this.speedAccuracy,
    this.timestamp,
  });

  final double latitude;
  final double longitude;
  final double accuracy; // em metros
  final double? altitude;
  final double? heading; // direção em graus (0-360)
  final double? speed; // velocidade em m/s
  final double? speedAccuracy;
  final DateTime? timestamp;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        accuracy,
        altitude,
        heading,
        speed,
        speedAccuracy,
        timestamp,
      ];
}
