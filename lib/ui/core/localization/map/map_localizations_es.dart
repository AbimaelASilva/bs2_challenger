import 'map_localizations.dart';

class MapLocalizationsEs extends MapLocalizations {
  MapLocalizationsEs() : super('es');

  @override
  String get ok => 'OK';
  @override
  String get cancel => 'Cancelar';
  @override
  String get delete => 'Eliminar';
  @override
  String get edit => 'Editar';
  @override
  String get duplicate => 'Duplicar';
  @override
  String get route => 'Ruta';
  @override
  String get goTo => 'Ir a';

  @override
  String get locationPermissionNeededTitle =>
      'Se requiere permiso de ubicación';
  @override
  String get locationPermissionNeededMessage =>
      'Esta app necesita tu ubicación para mostrar tu posición en el mapa y ayudar a encontrar plantas.';
  @override
  String get openSettings => 'Abrir configuración';
  @override
  String get grantPermission => 'Conceder permiso';

  @override
  String get coordinates => 'Coordenadas';
  @override
  String get distance => 'Distancia';
  @override
  String get notes => 'Notas';
  @override
  String get tags => 'Etiquetas';
  @override
  String get deletePlant => 'Eliminar planta';
  @override
  String get confirmDeletePlantTitle => '¿Eliminar planta?';
  @override
  String get confirmDeletePlantMessage => 'Esta acción no se puede deshacer.';

  @override
  String get plantList => 'Lista de plantas';
  @override
  String get noPlants => 'No hay plantas registradas';
  @override
  String get noResults => 'No se encontraron plantas';

  @override
  String get menuMap => 'Mapa';
  @override
  String get menuPlantsList => 'Lista de plantas';
  @override
  String get menuImportExport => 'Importar/Exportar';
  @override
  String get menuSettings => 'Configuración';
  @override
  String get menuAbout => 'Acerca de';
  @override
  String get menuLanguage => 'Idioma';

  // Plant form
  @override
  String get newPlantTitle => 'Nueva planta';
  @override
  String get editPlantTitle => 'Editar planta';
  @override
  String get duplicatePlantTitle => 'Duplicar planta';
  @override
  String get useCurrentLocation => 'Usar mi ubicación actual';
  @override
  String get useCurrentLocationSubtitle =>
      'Actualiza latitud/longitud en tiempo real';
  @override
  String get nameLabel => 'Nombre';
  @override
  String get idUniqueLabel => 'ID (único)';
  @override
  String get genotypeLabel => 'Genotipo (opcional)';
  @override
  String get latitudeLabel => 'Latitud';
  @override
  String get longitudeLabel => 'Longitud';
  @override
  String get saveAction => 'Guardar';
  @override
  String get invalidCoordinates => 'Coordenadas inválidas';
  @override
  String get plantAddedSuccess => 'Planta agregada';
  @override
  String get plantUpdatedSuccess => 'Planta actualizada';

  // Plants list
  @override
  String get searchHint => 'Buscar por nombre, ID o genotipo...';
  @override
  String get tryAgain => 'Intentar de nuevo';
  @override
  String get plantDeleted => 'Planta eliminada';
  @override
  String get goToPlant => 'Ir a esta planta';
  @override
  String get filterPlants => 'Filtrar Plantas';
  @override
  String get healthStatus => 'Estado de Salud:';
  @override
  String get all => 'Todos';
  @override
  String get clearFilters => 'Limpiar Filtros';
  @override
  String get sortBy => 'Ordenar Por';
  @override
  String get sortByName => 'Nombre';
  @override
  String get sortByDistance => 'Distancia';
  @override
  String get sortByHealth => 'Salud';
  @override
  String get sortByGenotype => 'Genotipo';

  // Import/Export
  @override
  String get importExportTitle => 'Importar/Exportar';
  @override
  String get importData => 'Importar Datos';
  @override
  String get exportData => 'Exportar Datos';
  @override
  String get importPlantsCsv => 'Importar Plantas (CSV)';
  @override
  String get importPlantsCsvSubtitle => 'Importar plantas desde un archivo CSV';
  @override
  String get importPlantsGeoJson => 'Importar Plantas (GeoJSON)';
  @override
  String get importPlantsGeoJsonSubtitle =>
      'Importar plantas desde un archivo GeoJSON';
  @override
  String get importAreasGeoJson => 'Importar Áreas (GeoJSON)';
  @override
  String get importAreasGeoJsonSubtitle =>
      'Importar áreas desde un archivo GeoJSON';
  @override
  String get importAreasKml => 'Importar Áreas (KML)';
  @override
  String get importAreasKmlSubtitle => 'Importar áreas desde un archivo KML';
  @override
  String get exportPlantsCsv => 'Exportar Plantas (CSV)';
  @override
  String get exportPlantsCsvSubtitle => 'Exportar todas las plantas a CSV';
  @override
  String get exportPlantsGeoJson => 'Exportar Plantas (GeoJSON)';
  @override
  String get exportPlantsGeoJsonSubtitle =>
      'Exportar todas las plantas a GeoJSON';
  @override
  String get exportAreasGeoJson => 'Exportar Áreas (GeoJSON)';
  @override
  String get exportAreasGeoJsonSubtitle => 'Exportar todas las áreas a GeoJSON';

  // Settings
  @override
  String get settingsTitle => 'Configuraciones';
  @override
  String get locationSection => 'Ubicación';
  @override
  String get navigationSection => 'Navegación';
  @override
  String get interfaceSection => 'Interfaz';
  @override
  String get gpsAccuracy => 'Precisión del GPS';
  @override
  String get distanceFilter => 'Filtro de Distancia';
  @override
  String get meters => 'metros';
  @override
  String get proximityRadius => 'Radio de Proximidad';
  @override
  String get vibrateOnProximity => 'Vibrar al Acercarse';
  @override
  String get vibrateOnProximitySubtitle =>
      'Vibra al entrar en el radio de proximidad';
  @override
  String get fieldMode => 'Modo Campo';
  @override
  String get fieldModeSubtitle => 'Interfaz optimizada para uso en campo';
  @override
  String get resetSettings => 'Restablecer';
  @override
  String get resetSettingsTitle => 'Restablecer Configuraciones';
  @override
  String get resetSettingsMessage =>
      '¿Estás seguro de que quieres restablecer todas las configuraciones a los valores predeterminados?';
  @override
  String get resetSettingsSuccess =>
      'Configuraciones restablecidas exitosamente';

  // Dialogs
  @override
  String get success => 'Éxito';
  @override
  String get error => 'Error';
  @override
  String get aboutAppDescription =>
      'Aplicación para localización de plantas en el campo usando GPS y mapas.';
  @override
  String get noAreasToExport => 'No hay áreas para exportar';
  @override
  String get exportError => 'Error de exportación';

  // Map types
  @override
  String get mapTypeNormal => 'Normal';
  @override
  String get mapTypeSatellite => 'Satélite';
  @override
  String get mapTypeTerrain => 'Terreno';
  @override
  String get mapTypeHybrid => 'Híbrido';

  // Accuracy indicators
  @override
  String get accuracyExcellent => 'Excelente';
  @override
  String get accuracyGood => 'Bueno';
  @override
  String get accuracyPoor => 'Malo';

  // Settings dialog labels
  @override
  String get fontSizeLabel => 'Tamaño de Fuente';
  @override
  String get fontSizeSubtitle => 'Tamaño de fuente';
  @override
  String get darkModeLabel => 'Modo Oscuro';
  @override
  String get darkModeSubtitle => 'Tema oscuro';
  @override
  String get actionsSection => 'Acciones';
  @override
  String get updatePositionEvery => 'Actualizar posición cada X metros:';
  @override
  String get noFilter => 'Sin filtro';
  @override
  String get updatePositionEveryX => 'Actualizar posición cada X metros:';

  // GPS Accuracy labels
  @override
  String get accuracyLowest => 'Más baja';
  @override
  String get accuracyLow => 'Baja';
  @override
  String get accuracyMedium => 'Media';
  @override
  String get accuracyHigh => 'Alta';
  @override
  String get accuracyBest => 'Mejor';
  @override
  String get accuracyBestForNavigation => 'Mejor para Navegación';
}
