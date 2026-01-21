import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../http/http.dart';
import 'env.dart';

class AppDependences {
  static final _getIt = GetIt.I;

  static GetIt registerModules() {
    _setup();
    _registerRepositories();
    _registerServices();
    _registerControllers();
    return _getIt;
  }

  static void _setup() {
    _getIt
      ..registerLazySingleton<GetStorage>(
        GetStorage.new,
      )
      ..registerLazySingleton<StorageService>(
        () => StorageService(
          box: _getIt(),
        ),
      );

    final dio = Dio();

    dio.interceptors.add(
      AuthInterceptor(
        storageService: _getIt(),
      ),
    );

    // Configura a URL base do Dio com base no ambiente carregado

    dio.options.baseUrl = Env.apiUrl;

    _getIt.registerLazySingleton<RestClient>(
      () => GenericClientAdapter(
        dio: dio,
        getStorage: _getIt(),
      ),
    );
  }

  static void _registerRepositories() {
    _getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(
        service: _getIt(),
        storageService: _getIt(),
      ),
    );
    _getIt.registerLazySingleton<UserRepository>(
      () => UserRepository(
        service: _getIt(),
      ),
    );
  }

  static void _registerServices() {
    _getIt.registerLazySingleton<AuthService>(
      () => AuthService(
        client: _getIt(),
      ),
    );
    _getIt.registerLazySingleton<UserService>(
      () => UserService(
        client: _getIt(),
      ),
    );
  }

  static void _registerControllers() {
    _getIt
      ..registerLazySingleton<HomeController>(
        () => HomeController(
          authRepository: _getIt(),
          storageService: _getIt(),
        ),
      )
      ..registerFactory<UserController>(
        () => UserController(
          userRepository: _getIt(),
          authRepository: _getIt(),
        ),
      )
      ..registerFactory<LoginCubit>(
        () => LoginCubit(
          repository: _getIt(),
        ),
      )
      ..registerFactory<AppCustomAppbarCubit>(
        () => AppCustomAppbarCubit(
          authRepository: _getIt(),
        ),
      );
  }
}
