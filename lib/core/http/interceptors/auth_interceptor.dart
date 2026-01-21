
import 'package:dio/dio.dart';

import '../../../data/data.dart';

/// [AuthInterceptor] class is a extends of interceptor
/// this class will show us the log what is request is doing
class AuthInterceptor extends Interceptor {
  const AuthInterceptor({required this.storageService});
  final StorageService storageService;
  // static const String _tokenKey = 'access-token';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // if (options.extra['auth_required'] == true) {
    // final noAuth = [
    //   '/user/register',
    //   '/auth/login',
    //   "open/list-games/onlive",
    //   "/open/list-position",
    // ];
    // if (!noAuth.contains(options.path)) {
    //   final credentials = storageService.fetchMap(CacheKey.credentials);

    //   credentials.fold(
    //     (success) => options.headers['Authorization'] =
    //         'Bearer ${success['accessToken']}',
    //     (failure) {
    //       log('error $failure');
    //     },
    //   );
    // }

    //Para as rotas abertas, força pegar a url base do ambiente de produção independente do ambiente que esteja rodando
    // if (options.path.contains('open')) {
    //   options.baseUrl = "http://api.examble.app.br/v1";
    // }

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
