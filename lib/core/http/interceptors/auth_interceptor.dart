import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  const AuthInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(options);
  }

  // @override
  // Future<void> onResponse(
  //   Response<dynamic> response,
  //   ResponseInterceptorHandler handler,
  // ) async {
  //   final accessToken = response.headers.value(_tokenKey);
  //   if (accessToken != null) {
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString(_tokenKey, accessToken);
  //   }
  //   handler.next(response);
  // }
}
