import 'package:result_dart/result_dart.dart';

import '../response/rest_client_exception.dart';

AsyncResult<T> handleRequest<T extends Object>(
  Future<T> Function() request,
) async {
  try {
    final result = await request();
    return Success(result);
  } on RestClientException catch (error, stackTrace) {
    return Failure(
      RestClientException(
        message: error.message,
        error: stackTrace,
        statusCode: error.statusCode,
        response: error.response,
      ),
    );
  } catch (e, stackTrace) {
    // Opcional: captura de outros erros não esperados
    return Failure(
      RestClientException(
        message: 'Erro ao realizar requisição',
        error: stackTrace,
      ),
    );
  }
}
