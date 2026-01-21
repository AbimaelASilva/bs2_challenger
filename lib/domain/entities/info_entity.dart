class InfoEntity {
  final String seed;
  final int results;
  final int page;
  final String version;

  const InfoEntity({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  InfoEntity.empty()
      : seed = '',
        results = 0,
        page = 0,
        version = '';

  InfoEntity copyWith({
    String? seed,
    int? results,
    int? page,
    String? version,
  }) {
    return InfoEntity(
      seed: seed ?? this.seed,
      results: results ?? this.results,
      page: page ?? this.page,
      version: version ?? this.version,
    );
  }
}
