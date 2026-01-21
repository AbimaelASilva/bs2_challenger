import 'map_localizations.dart';

class MapLocalizationsEn extends MapLocalizations {
  MapLocalizationsEn() : super('en');

  @override
  String get ok => 'OK';
  @override
  String get cancel => 'Cancel';
  @override
  String get delete => 'Delete';
  @override
  String get edit => 'Edit';
  @override
  String get duplicate => 'Duplicate';
  @override
  String get route => 'Route';
  @override
  String get goTo => 'Go to';

  @override
  String get locationPermissionNeededTitle => 'Location permission needed';
  @override
  String get locationPermissionNeededMessage =>
      'This app needs your location to show your position on the map and help find plants.';
  @override
  String get openSettings => 'Open Settings';
  @override
  String get grantPermission => 'Grant Permission';

  @override
  String get coordinates => 'Coordinates';
  @override
  String get distance => 'Distance';
  @override
  String get notes => 'Notes';
  @override
  String get tags => 'Tags';
  @override
  String get deletePlant => 'Delete plant';
  @override
  String get confirmDeletePlantTitle => 'Delete plant?';
  @override
  String get confirmDeletePlantMessage => 'This action cannot be undone.';

  @override
  String get plantList => 'Plant list';
  @override
  String get noPlants => 'No plants registered';
  @override
  String get noResults => 'No plants found';

  @override
  String get menuMap => 'Map';
  @override
  String get menuPlantsList => 'Plant list';
  @override
  String get menuImportExport => 'Import/Export';
  @override
  String get menuSettings => 'Settings';
  @override
  String get menuAbout => 'About';
  @override
  String get menuLanguage => 'Language';

  // Plant form
  @override
  String get newPlantTitle => 'New Plant';
  @override
  String get editPlantTitle => 'Edit Plant';
  @override
  String get duplicatePlantTitle => 'Duplicate Plant';
  @override
  String get useCurrentLocation => 'Use my current location';
  @override
  String get useCurrentLocationSubtitle =>
      'Update latitude/longitude in real-time';
  @override
  String get nameLabel => 'Name';
  @override
  String get idUniqueLabel => 'ID (unique)';
  @override
  String get genotypeLabel => 'Genotype (optional)';
  @override
  String get latitudeLabel => 'Latitude';
  @override
  String get longitudeLabel => 'Longitude';
  @override
  String get saveAction => 'Save';
  @override
  String get invalidCoordinates => 'Invalid coordinates';
  @override
  String get plantAddedSuccess => 'Plant added';
  @override
  String get plantUpdatedSuccess => 'Plant updated';

  // Plants list
  @override
  String get searchHint => 'Search by name, ID or genotype...';
  @override
  String get tryAgain => 'Try again';
  @override
  String get plantDeleted => 'Plant deleted';
  @override
  String get goToPlant => 'Go to this plant';
  @override
  String get filterPlants => 'Filter Plants';
  @override
  String get healthStatus => 'Health Status:';
  @override
  String get all => 'All';
  @override
  String get clearFilters => 'Clear Filters';
  @override
  String get sortBy => 'Sort By';
  @override
  String get sortByName => 'Name';
  @override
  String get sortByDistance => 'Distance';
  @override
  String get sortByHealth => 'Health';
  @override
  String get sortByGenotype => 'Genotype';

  // Import/Export
  @override
  String get importExportTitle => 'Import/Export';
  @override
  String get importData => 'Import Data';
  @override
  String get exportData => 'Export Data';
  @override
  String get importPlantsCsv => 'Import Plants (CSV)';
  @override
  String get importPlantsCsvSubtitle => 'Import plants from a CSV file';
  @override
  String get importPlantsGeoJson => 'Import Plants (GeoJSON)';
  @override
  String get importPlantsGeoJsonSubtitle => 'Import plants from a GeoJSON file';
  @override
  String get importAreasGeoJson => 'Import Areas (GeoJSON)';
  @override
  String get importAreasGeoJsonSubtitle => 'Import areas from a GeoJSON file';
  @override
  String get importAreasKml => 'Import Areas (KML)';
  @override
  String get importAreasKmlSubtitle => 'Import areas from a KML file';
  @override
  String get exportPlantsCsv => 'Export Plants (CSV)';
  @override
  String get exportPlantsCsvSubtitle => 'Export all plants to CSV';
  @override
  String get exportPlantsGeoJson => 'Export Plants (GeoJSON)';
  @override
  String get exportPlantsGeoJsonSubtitle => 'Export all plants to GeoJSON';
  @override
  String get exportAreasGeoJson => 'Export Areas (GeoJSON)';
  @override
  String get exportAreasGeoJsonSubtitle => 'Export all areas to GeoJSON';

  // Settings
  @override
  String get settingsTitle => 'Settings';
  @override
  String get locationSection => 'Location';
  @override
  String get navigationSection => 'Navigation';
  @override
  String get interfaceSection => 'Interface';
  @override
  String get gpsAccuracy => 'GPS Accuracy';
  @override
  String get distanceFilter => 'Distance Filter';
  @override
  String get meters => 'meters';
  @override
  String get proximityRadius => 'Proximity Radius';
  @override
  String get vibrateOnProximity => 'Vibrate on Proximity';
  @override
  String get vibrateOnProximitySubtitle =>
      'Vibrates when entering proximity radius';
  @override
  String get fieldMode => 'Field Mode';
  @override
  String get fieldModeSubtitle => 'Interface optimized for field use';
  @override
  String get resetSettings => 'Reset';
  @override
  String get resetSettingsTitle => 'Reset Settings';
  @override
  String get resetSettingsMessage =>
      'Are you sure you want to reset all settings to default values?';
  @override
  String get resetSettingsSuccess => 'Settings reset successfully';

  // Dialogs
  @override
  String get success => 'Success';
  @override
  String get error => 'Error';
  @override
  String get aboutAppDescription =>
      'Application for plant location in the field using GPS and maps.';
  @override
  String get noAreasToExport => 'No areas to export';
  @override
  String get exportError => 'Export error';

  // Map types
  @override
  String get mapTypeNormal => 'Normal';
  @override
  String get mapTypeSatellite => 'Satellite';
  @override
  String get mapTypeTerrain => 'Terrain';
  @override
  String get mapTypeHybrid => 'Hybrid';

  // Accuracy indicators
  @override
  String get accuracyExcellent => 'Excellent';
  @override
  String get accuracyGood => 'Good';
  @override
  String get accuracyPoor => 'Poor';

  // Settings dialog labels
  @override
  String get fontSizeLabel => 'Font Size';
  @override
  String get fontSizeSubtitle => 'Font size';
  @override
  String get darkModeLabel => 'Dark Mode';
  @override
  String get darkModeSubtitle => 'Dark theme';
  @override
  String get actionsSection => 'Actions';
  @override
  String get updatePositionEvery => 'Update position every X meters:';
  @override
  String get noFilter => 'No filter';
  @override
  String get updatePositionEveryX => 'Update position every X meters:';

  // GPS Accuracy labels
  @override
  String get accuracyLowest => 'Lowest';
  @override
  String get accuracyLow => 'Low';
  @override
  String get accuracyMedium => 'Medium';
  @override
  String get accuracyHigh => 'High';
  @override
  String get accuracyBest => 'Best';
  @override
  String get accuracyBestForNavigation => 'Best for Navigation';
}
