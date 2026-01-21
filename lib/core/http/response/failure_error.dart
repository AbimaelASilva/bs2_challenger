/// Default Error Exception Class
class FailureError implements Exception {
  /// constructor of FailureError Exception
  FailureError({
    this.message,
    this.statusCode,
  });

  /// Return a error Message
  final String? message;

  final int? statusCode;
}
