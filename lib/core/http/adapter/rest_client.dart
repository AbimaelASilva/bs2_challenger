import 'dart:async';

import 'package:dio/dio.dart';

import '../response/response.dart';

/// HttpClient contract which it need to have to work
abstract class RestClient {
// coverage:ignore-start
  RestClient();
  // coverage:ignore-end

  /// RestClientAdapter authenticate
  RestClient auth();

  /// RestClientAdapter unauthenticated
  RestClient unAuth();

  BaseOptions get getOptions;

  /// RestClientAdapter options to change the default options
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
  });

  /// Add interceptor to the client
  void addInterceptor(Interceptor interceptor);

  /// Change the authRequiredKey
  void changeAuthRequiredKey(String authRequiredKey);

  /// POST method
  Future<RestClientResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// GET method
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// PUT method
  Future<RestClientResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// DELETE method
  Future<RestClientResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// PATCH method
  Future<RestClientResponse<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
