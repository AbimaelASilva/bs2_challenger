
import '../response/response.dart';

///Class to return default errors messages
class ErrorsString {
  ///Errors String Constructor
  ErrorsString({
    required this.code_204,
    required this.code_304,
    required this.code_400,
    required this.code_401,
    required this.code_403,
    required this.code_404,
    required this.code_405,
    required this.code_406,
    required this.code_500,
    required this.messageDefault,
  });

  ///No Content
  String? code_204;

  ///Not Modified
  String? code_304;

  ///Bad Request
  String? code_400;

  ///Unauthorized.
  String? code_401;

  ///Forbidden
  String? code_403;

  ///Not Found
  String? code_404;

  ///Method Not Allowed
  String? code_405;

  ///Not Acceptable
  String? code_406;

  ///Internal Server Error
  String? code_500;

  ///Erro default
  String messageDefault;

  /// Automatic default strings to replicate in response
  // ignore: prefer_constructors_over_static_methods
  static String automaticMessages({
    String? messageToBeReplicated,
    required RestClientException exception,
  }) {
    // final String messageDefault = _getMessageDefault(exception);

    /*
    return ErrorsString(
      code_204: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code204,
      code_304: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code304,
      code_400: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code400,
      code_401: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code401,
      code_403: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code403,
      code_404: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code404,
      code_405: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code405,
      code_406: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code406,
      code_500: messageToBeReplicated ??
          navigatorKey.currentContext!.tr.erros.code500,
      messageDefault: messageDefault,
    );
    */

    return _getMessageDefault(exception);
  }
}

String _getMessageDefault(RestClientException exception) {
  final data = exception.response?.data;
  if (data == null) {
    return "Não foi possível realizar a comunicação com o servidor. Verifique sua internet.";
  }
  if (data is Map) {
    final errorText = data['message'];
    if (errorText?.isNotEmpty == true) {
      return errorText.toString();
    }
  }
  return "O servidor retornou um erro inesperado";
}
