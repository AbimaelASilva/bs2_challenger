import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Repositório para gerenciar configurações do app
class SettingsRepository {
  static const String _accuracyKey = 'location_accuracy';
  static const String _distanceFilterKey = 'distance_filter';
  static const String _proximityRadiusKey = 'proximity_radius';
  static const String _fieldModeKey = 'field_mode';
  static const String _autoFollowKey = 'auto_follow';
  static const String _directionsApiEnabledKey = 'directions_api_enabled';
  static const String _vibrateOnProximityKey = 'vibrate_on_proximity';
  static const String _fontSizeMultiplierKey = 'font_size_multiplier';
  static const String _mapTypeKey = 'map_type';
  static const String _darkModeKey = 'dark_mode';

  final SharedPreferences _prefs;

  SettingsRepository(this._prefs);

  // Precisão do GPS
  Future<void> setLocationAccuracy(LocationAccuracy accuracy) async {
    await _prefs.setString(_accuracyKey, accuracy.name);
  }

  LocationAccuracy getLocationAccuracy() {
    final value = _prefs.getString(_accuracyKey);
    switch (value) {
      case 'lowest':
        return LocationAccuracy.lowest;
      case 'low':
        return LocationAccuracy.low;
      case 'medium':
        return LocationAccuracy.medium;
      case 'high':
        return LocationAccuracy.high;
      case 'best':
        return LocationAccuracy.best;
      case 'bestForNavigation':
        return LocationAccuracy.bestForNavigation;
      default:
        return LocationAccuracy.bestForNavigation;
    }
  }

  // Filtro de distância (metros)
  Future<void> setDistanceFilter(int meters) async {
    await _prefs.setInt(_distanceFilterKey, meters);
  }

  int getDistanceFilter() {
    return _prefs.getInt(_distanceFilterKey) ?? 1;
  }

  // Raio de proximidade (metros)
  Future<void> setProximityRadius(double meters) async {
    await _prefs.setDouble(_proximityRadiusKey, meters);
  }

  double getProximityRadius() {
    return _prefs.getDouble(_proximityRadiusKey) ?? 5.0;
  }

  // Modo Campo
  Future<void> setFieldMode(bool enabled) async {
    await _prefs.setBool(_fieldModeKey, enabled);
  }

  bool getFieldMode() {
    return _prefs.getBool(_fieldModeKey) ?? false;
  }

  // Auto Follow
  Future<void> setAutoFollow(bool enabled) async {
    await _prefs.setBool(_autoFollowKey, enabled);
  }

  bool getAutoFollow() {
    return _prefs.getBool(_autoFollowKey) ?? true;
  }

  // Directions API
  Future<void> setDirectionsApiEnabled(bool enabled) async {
    await _prefs.setBool(_directionsApiEnabledKey, enabled);
  }

  bool getDirectionsApiEnabled() {
    return _prefs.getBool(_directionsApiEnabledKey) ?? false;
  }

  // Vibrar ao chegar próximo
  Future<void> setVibrateOnProximity(bool enabled) async {
    await _prefs.setBool(_vibrateOnProximityKey, enabled);
  }

  bool getVibrateOnProximity() {
    return _prefs.getBool(_vibrateOnProximityKey) ?? true;
  }

  // Multiplicador de fonte
  Future<void> setFontSizeMultiplier(double multiplier) async {
    await _prefs.setDouble(_fontSizeMultiplierKey, multiplier);
  }

  double getFontSizeMultiplier() {
    return _prefs.getDouble(_fontSizeMultiplierKey) ?? 1.0;
  }

  // Tipo de mapa
  Future<void> setMapType(String type) async {
    await _prefs.setString(_mapTypeKey, type);
  }

  String getMapType() {
    return _prefs.getString(_mapTypeKey) ?? 'normal';
  }

  // Modo escuro
  Future<void> setDarkMode(bool enabled) async {
    await _prefs.setBool(_darkModeKey, enabled);
  }

  bool getDarkMode() {
    return _prefs.getBool(_darkModeKey) ?? false;
  }

  // Reset todas configurações
  Future<void> resetSettings() async {
    await _prefs.remove(_accuracyKey);
    await _prefs.remove(_distanceFilterKey);
    await _prefs.remove(_proximityRadiusKey);
    await _prefs.remove(_fieldModeKey);
    await _prefs.remove(_autoFollowKey);
    await _prefs.remove(_directionsApiEnabledKey);
    await _prefs.remove(_vibrateOnProximityKey);
    await _prefs.remove(_fontSizeMultiplierKey);
    await _prefs.remove(_mapTypeKey);
    await _prefs.remove(_darkModeKey);
  }
}
