class BaseException implements Exception {
  const BaseException({
    this.statusCode = 0,
    required this.error,
    this.message,
    this.stackTrace,
  });

  final int? statusCode;

  final String? message;

  final Object? error;

  final StackTrace? stackTrace;
}
