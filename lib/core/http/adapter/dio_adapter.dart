// ignore_for_file: unawaited_futures

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../response/response.dart';
import '../status_exception/errors_string.dart';
import 'rest_client.dart';

class GenericClientAdapter implements RestClient {
  GenericClientAdapter({
    required this.dio,
  });

  final Dio dio;

  String authRequiredKey = 'auth_required';

  @override
  BaseOptions get getOptions => dio.options;

  @override
  RestClient auth() {
    dio.options.extra[authRequiredKey] = true;
    return this;
  }

  @override
  void options({
    String? method,
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    String? path,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    Map<String, Object?>? extra,
    Map<String, Object?>? headers,
    bool? preserveHeaderCase,
    ResponseType? responseType,
    String? contentType,
    bool Function(int?)? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    bool? persistentConnection,
    FutureOr<List<int>> Function(String, RequestOptions)? requestEncoder,
    FutureOr<String?> Function(List<int>, RequestOptions, ResponseBody)?
        responseDecoder,
    ListFormat? listFormat,
    List<Interceptor>? interceptors,
  }) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      method: method,
      queryParameters: queryParameters,
      path: path,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      extra: extra,
      headers: headers,
      preserveHeaderCase: preserveHeaderCase,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      persistentConnection: persistentConnection,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
    if (interceptors != null) {
      dio.interceptors.addAll(interceptors);
    }
  }

  @override
  RestClient unAuth() {
    dio.options.extra[authRequiredKey] = false;
    return this;
  }

  @override
  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }

  @override
  void changeAuthRequiredKey(String authRequiredKey) =>
      this.authRequiredKey = authRequiredKey;

  @override
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return _response<T>(response);
    } on DioException catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return _response<T>(response);
    } on DioException catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return _response<T>(response);
    } on DioException catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return _response<T>(response);
    } on DioException catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return _response<T>(response);
    } on DioException catch (e) {
      throw _clientException(e);
    } catch (_) {
      rethrow;
    }
  }

  RestClientResponse<T> _response<T>(Response<T> response) {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  RestClientException _clientException(DioException error) {
    final errorsString = ErrorsString.automaticMessages(
      exception: RestClientException(
        message: error.response?.statusMessage,
        statusCode: error.response?.statusCode,
        error: error.error,
        response:
            error.response != null ? _response<dynamic>(error.response!) : null,
      ),
    );

    // String errorMessage = errorsString.messageDefault;
    // if (error.response?.statusCode != null) {
    //   switch (error.response?.statusCode) {
    //     case 204:
    //       errorMessage = errorsString.code_204 ?? errorMessage;
    //     case 304:
    //       errorMessage = errorsString.code_304 ?? errorMessage;
    //     case 400:
    //       errorMessage = errorsString.code_400 ?? errorMessage;
    //     case 401:
    //       errorMessage = errorsString.code_401 ?? errorMessage;
    //     case 403:
    //       errorMessage = errorsString.code_403 ?? errorMessage;
    //     case 404:
    //       errorMessage = errorsString.code_404 ?? errorMessage;
    //     case 405:
    //       errorMessage = errorsString.code_405 ?? errorMessage;
    //     case 406:
    //       errorMessage = errorsString.code_406 ?? errorMessage;
    //     case 500:
    //       errorMessage = errorsString.code_500 ?? errorMessage;
    //   }
    // }

    return RestClientException(
      message: errorsString,
      statusCode: error.response?.statusCode,
      error: error.error,
      response:
          error.response != null ? _response<dynamic>(error.response!) : null,
    );
  }
}
