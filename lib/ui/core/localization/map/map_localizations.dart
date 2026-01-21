import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'map_localizations_en.dart';
import 'map_localizations_es.dart';
import 'map_localizations_pt.dart';

abstract class MapLocalizations {
  MapLocalizations(String locale) : localeName = locale;
  final String localeName;

  static MapLocalizations of(BuildContext context) {
    return Localizations.of<MapLocalizations>(context, MapLocalizations)!;
  }

  static const LocalizationsDelegate<MapLocalizations> delegate =
      _MapLocalizationsDelegate();

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  // Common
  String get ok;
  String get cancel;
  String get delete;
  String get edit;
  String get duplicate;
  String get route;
  String get goTo;

  // Permissions
  String get locationPermissionNeededTitle;
  String get locationPermissionNeededMessage;
  String get openSettings;
  String get grantPermission;

  // Bottom sheet
  String get coordinates;
  String get distance;
  String get notes;
  String get tags;
  String get deletePlant;
  String get confirmDeletePlantTitle;
  String get confirmDeletePlantMessage;

  // List
  String get plantList;
  String get noPlants;
  String get noResults;

  // Drawer/Menu
  String get menuMap;
  String get menuPlantsList;
  String get menuImportExport;
  String get menuSettings;
  String get menuAbout;
  String get menuLanguage;

  // Plant form
  String get newPlantTitle;
  String get editPlantTitle;
  String get duplicatePlantTitle;
  String get useCurrentLocation;
  String get useCurrentLocationSubtitle;
  String get nameLabel;
  String get idUniqueLabel;
  String get genotypeLabel;
  String get latitudeLabel;
  String get longitudeLabel;
  String get saveAction;
  String get invalidCoordinates;
  String get plantAddedSuccess;
  String get plantUpdatedSuccess;

  // Plants list
  String get searchHint;
  String get tryAgain;
  String get plantDeleted;
  String get goToPlant;
  String get filterPlants;
  String get healthStatus;
  String get all;
  String get clearFilters;
  String get sortBy;
  String get sortByName;
  String get sortByDistance;
  String get sortByHealth;
  String get sortByGenotype;

  // Import/Export
  String get importExportTitle;
  String get importData;
  String get exportData;
  String get importPlantsCsv;
  String get importPlantsCsvSubtitle;
  String get importPlantsGeoJson;
  String get importPlantsGeoJsonSubtitle;
  String get importAreasGeoJson;
  String get importAreasGeoJsonSubtitle;
  String get importAreasKml;
  String get importAreasKmlSubtitle;
  String get exportPlantsCsv;
  String get exportPlantsCsvSubtitle;
  String get exportPlantsGeoJson;
  String get exportPlantsGeoJsonSubtitle;
  String get exportAreasGeoJson;
  String get exportAreasGeoJsonSubtitle;

  // Settings
  String get settingsTitle;
  String get locationSection;
  String get navigationSection;
  String get interfaceSection;
  String get gpsAccuracy;
  String get distanceFilter;
  String get meters;
  String get proximityRadius;
  String get vibrateOnProximity;
  String get vibrateOnProximitySubtitle;
  String get fieldMode;
  String get fieldModeSubtitle;
  String get resetSettings;
  String get resetSettingsTitle;
  String get resetSettingsMessage;
  String get resetSettingsSuccess;

  // Dialogs
  String get success;
  String get error;
  String get aboutAppDescription;
  String get noAreasToExport;
  String get exportError;

  // Map types
  String get mapTypeNormal;
  String get mapTypeSatellite;
  String get mapTypeTerrain;
  String get mapTypeHybrid;

  // Accuracy indicators
  String get accuracyExcellent;
  String get accuracyGood;
  String get accuracyPoor;

  // Settings dialog labels
  String get fontSizeLabel;
  String get fontSizeSubtitle;
  String get darkModeLabel;
  String get darkModeSubtitle;
  String get actionsSection;
  String get updatePositionEvery;
  String get noFilter;
  String get updatePositionEveryX;

  // GPS Accuracy labels
  String get accuracyLowest;
  String get accuracyLow;
  String get accuracyMedium;
  String get accuracyHigh;
  String get accuracyBest;
  String get accuracyBestForNavigation;
}

class _MapLocalizationsDelegate
    extends LocalizationsDelegate<MapLocalizations> {
  const _MapLocalizationsDelegate();

  @override
  Future<MapLocalizations> load(Locale locale) {
    return SynchronousFuture<MapLocalizations>(_lookup(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_MapLocalizationsDelegate old) => false;
}

MapLocalizations _lookup(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return MapLocalizationsEn();
    case 'es':
      return MapLocalizationsEs();
    case 'pt':
    default:
      return MapLocalizationsPt();
  }
}
