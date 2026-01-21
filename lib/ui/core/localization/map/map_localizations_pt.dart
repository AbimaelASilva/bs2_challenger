import 'map_localizations.dart';

class MapLocalizationsPt extends MapLocalizations {
  MapLocalizationsPt() : super('pt');

  @override
  String get ok => 'OK';
  @override
  String get cancel => 'Cancelar';
  @override
  String get delete => 'Excluir';
  @override
  String get edit => 'Editar';
  @override
  String get duplicate => 'Duplicar';
  @override
  String get route => 'Rota';
  @override
  String get goTo => 'Ir até';

  @override
  String get locationPermissionNeededTitle =>
      'Permissão de localização necessária';
  @override
  String get locationPermissionNeededMessage =>
      'Este app precisa acessar sua localização para mostrar sua posição no mapa e ajudar a encontrar plantas.';
  @override
  String get openSettings => 'Abrir Configurações';
  @override
  String get grantPermission => 'Conceder Permissão';

  @override
  String get coordinates => 'Coordenadas';
  @override
  String get distance => 'Distância';
  @override
  String get notes => 'Observações';
  @override
  String get tags => 'Tags';
  @override
  String get deletePlant => 'Excluir planta';
  @override
  String get confirmDeletePlantTitle => 'Excluir planta?';
  @override
  String get confirmDeletePlantMessage => 'Esta ação não pode ser desfeita.';

  @override
  String get plantList => 'Lista de Plantas';
  @override
  String get noPlants => 'Nenhuma planta cadastrada';
  @override
  String get noResults => 'Nenhuma planta encontrada';

  @override
  String get menuMap => 'Mapa';
  @override
  String get menuPlantsList => 'Lista de Plantas';
  @override
  String get menuImportExport => 'Importar/Exportar';
  @override
  String get menuSettings => 'Configurações';
  @override
  String get menuAbout => 'Sobre';
  @override
  String get menuLanguage => 'Idioma';

  // Plant form
  @override
  String get newPlantTitle => 'Nova Planta';
  @override
  String get editPlantTitle => 'Editar Planta';
  @override
  String get duplicatePlantTitle => 'Duplicar Planta';
  @override
  String get useCurrentLocation => 'Usar minha localização atual';
  @override
  String get useCurrentLocationSubtitle =>
      'Atualiza latitude/longitude em tempo real';
  @override
  String get nameLabel => 'Nome';
  @override
  String get idUniqueLabel => 'ID (único)';
  @override
  String get genotypeLabel => 'Genótipo (opcional)';
  @override
  String get latitudeLabel => 'Latitude';
  @override
  String get longitudeLabel => 'Longitude';
  @override
  String get saveAction => 'Salvar';
  @override
  String get invalidCoordinates => 'Coordenadas inválidas';
  @override
  String get plantAddedSuccess => 'Planta adicionada';
  @override
  String get plantUpdatedSuccess => 'Planta atualizada';

  // Plants list
  @override
  String get searchHint => 'Buscar por nome, ID ou genótipo...';
  @override
  String get tryAgain => 'Tentar novamente';
  @override
  String get plantDeleted => 'Planta excluída';
  @override
  String get goToPlant => 'Ir até esta planta';
  @override
  String get filterPlants => 'Filtrar Plantas';
  @override
  String get healthStatus => 'Estado de Saúde:';
  @override
  String get all => 'Todos';
  @override
  String get clearFilters => 'Limpar Filtros';
  @override
  String get sortBy => 'Ordenar Por';
  @override
  String get sortByName => 'Nome';
  @override
  String get sortByDistance => 'Distância';
  @override
  String get sortByHealth => 'Saúde';
  @override
  String get sortByGenotype => 'Genótipo';

  // Import/Export
  @override
  String get importExportTitle => 'Importar/Exportar';
  @override
  String get importData => 'Importar Dados';
  @override
  String get exportData => 'Exportar Dados';
  @override
  String get importPlantsCsv => 'Importar Plantas (CSV)';
  @override
  String get importPlantsCsvSubtitle => 'Importa plantas de um arquivo CSV';
  @override
  String get importPlantsGeoJson => 'Importar Plantas (GeoJSON)';
  @override
  String get importPlantsGeoJsonSubtitle =>
      'Importa plantas de um arquivo GeoJSON';
  @override
  String get importAreasGeoJson => 'Importar Talhões (GeoJSON)';
  @override
  String get importAreasGeoJsonSubtitle =>
      'Importa talhões de um arquivo GeoJSON';
  @override
  String get importAreasKml => 'Importar Talhões (KML)';
  @override
  String get importAreasKmlSubtitle => 'Importa talhões de um arquivo KML';
  @override
  String get exportPlantsCsv => 'Exportar Plantas (CSV)';
  @override
  String get exportPlantsCsvSubtitle => 'Exporta todas as plantas para CSV';
  @override
  String get exportPlantsGeoJson => 'Exportar Plantas (GeoJSON)';
  @override
  String get exportPlantsGeoJsonSubtitle =>
      'Exporta todas as plantas para GeoJSON';
  @override
  String get exportAreasGeoJson => 'Exportar Talhões (GeoJSON)';
  @override
  String get exportAreasGeoJsonSubtitle =>
      'Exporta todos os talhões para GeoJSON';

  // Settings
  @override
  String get settingsTitle => 'Configurações';
  @override
  String get locationSection => 'Localização';
  @override
  String get navigationSection => 'Navegação';
  @override
  String get interfaceSection => 'Interface';
  @override
  String get gpsAccuracy => 'Precisão do GPS';
  @override
  String get distanceFilter => 'Filtro de Distância';
  @override
  String get meters => 'metros';
  @override
  String get proximityRadius => 'Raio de Proximidade';
  @override
  String get vibrateOnProximity => 'Vibrar ao Chegar Próximo';
  @override
  String get vibrateOnProximitySubtitle =>
      'Vibra quando entrar no raio de proximidade';
  @override
  String get fieldMode => 'Modo Campo';
  @override
  String get fieldModeSubtitle => 'Interface otimizada para uso em campo';
  @override
  String get resetSettings => 'Resetar';
  @override
  String get resetSettingsTitle => 'Resetar Configurações';
  @override
  String get resetSettingsMessage =>
      'Tem certeza que deseja resetar todas as configurações para os valores padrão?';
  @override
  String get resetSettingsSuccess => 'Configurações resetadas com sucesso';

  // Dialogs
  @override
  String get success => 'Sucesso';
  @override
  String get error => 'Erro';
  @override
  String get aboutAppDescription =>
      'Aplicativo para localização de plantas no campo usando GPS e mapas.';
  @override
  String get noAreasToExport => 'Nenhum talhão para exportar';
  @override
  String get exportError => 'Erro ao exportar';

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
  String get accuracyGood => 'Bom';
  @override
  String get accuracyPoor => 'Ruim';

  // Settings dialog labels
  @override
  String get fontSizeLabel => 'Tamanho da Fonte';
  @override
  String get fontSizeSubtitle => 'Tamanho da fonte';
  @override
  String get darkModeLabel => 'Modo Escuro';
  @override
  String get darkModeSubtitle => 'Tema escuro';
  @override
  String get actionsSection => 'Ações';
  @override
  String get updatePositionEvery => 'Atualizar posição a cada X metros:';
  @override
  String get noFilter => 'Sem filtro';
  @override
  String get updatePositionEveryX => 'Atualizar posição a cada X metros:';

  // GPS Accuracy labels
  @override
  String get accuracyLowest => 'Mais baixa';
  @override
  String get accuracyLow => 'Baixa';
  @override
  String get accuracyMedium => 'Média';
  @override
  String get accuracyHigh => 'Alta';
  @override
  String get accuracyBest => 'Melhor';
  @override
  String get accuracyBestForNavigation => 'Melhor para Navegação';
}
