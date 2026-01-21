import 'dart:async';
import 'package:geolocator/geolocator.dart';

import '../../domain/entities/user_position.dart';

/// Serviço de localização que gerencia o GPS e rastreamento
class LocationService {
  StreamSubscription<Position>? _positionSubscription;
  final _positionController = StreamController<UserPosition>.broadcast();

  Stream<UserPosition> get positionStream => _positionController.stream;

  /// Verifica se o serviço de localização está habilitado
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Verifica o status da permissão de localização
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  /// Solicita permissão de localização
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  /// Obtém a posição atual uma única vez
  Future<UserPosition> getCurrentPosition({
    LocationAccuracy accuracy = LocationAccuracy.bestForNavigation,
  }) async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: 0,
      ),
    );

    return _positionToUserPosition(position);
  }

  /// Inicia o rastreamento contínuo da posição
  void startTracking({
    LocationAccuracy accuracy = LocationAccuracy.bestForNavigation,
    int distanceFilter = 1, // metros
    int timeLimit = 0, // segundos (0 = sem limite)
  }) {
    final locationSettings = LocationSettings(
      accuracy: accuracy,
      distanceFilter: distanceFilter,
      timeLimit: timeLimit > 0 ? Duration(seconds: timeLimit) : null,
    );

    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen(
      (position) {
        _positionController.add(_positionToUserPosition(position));
      },
      onError: (Object error) {
        _positionController.addError(error);
      },
    );
  }

  /// Para o rastreamento contínuo
  void stopTracking() {
    _positionSubscription?.cancel();
    _positionSubscription = null;
  }

  /// Verifica se está rastreando atualmente
  bool get isTracking => _positionSubscription != null;

  /// Abre as configurações de localização do dispositivo
  Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  /// Abre as configurações do app
  Future<bool> openAppSettings() async {
    return await Geolocator.openAppSettings();
  }

  /// Calcula a distância entre dois pontos
  double distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }

  /// Converte Position para UserPosition
  UserPosition _positionToUserPosition(Position position) {
    return UserPosition(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      altitude: position.altitude,
      heading: position.heading,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
      timestamp: position.timestamp,
    );
  }

  /// Limpa recursos
  void dispose() {
    stopTracking();
    _positionController.close();
  }
}
