import '../response/response.dart';
import 'errors_string.dart';

/// Status code message and cases
class HttpStatusException {
  /// build a error to throw
  FailureError build(int statusCode, ErrorsString erros,
      {String message = '',}) {
    switch (statusCode) {
      case 204:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_204,
          statusCode: statusCode,
        );
      case 304:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_304,
          statusCode: statusCode,
        );
      case 400:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_400,
          statusCode: statusCode,
        );
      case 401:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_401,
          statusCode: statusCode,
        );
      case 403:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_403,
          statusCode: statusCode,
        );
      case 404:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_404,
          statusCode: statusCode,
        );
      case 405:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_405,
          statusCode: statusCode,
        );
      case 406:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_406,
          statusCode: statusCode,
        );
      case 500:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.code_500,
          statusCode: statusCode,
        );
      default:
        return throw FailureError(
          message: message.isNotEmpty ? message : erros.messageDefault,
          statusCode: statusCode,
        );
    }
  }
}
