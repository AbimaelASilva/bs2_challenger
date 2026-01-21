import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';
import '../../presentation/presentation.dart';
import '../http/adapter/dio_adapter.dart';
import '../http/adapter/rest_client.dart';

class AppDependences {
  static final _getIt = GetIt.I;

  static GetIt registerModules() {
    _setup();
    _registerServices();
    _registerRepositories();
    _registerViewModels();
    return _getIt;
  }

  static void _setup() {
    _getIt.registerLazySingleton<RestClient>(
      () => GenericClientAdapter(
        dio: Dio(),
      ),
    );
  }

  static void _registerServices() {
    _getIt.registerLazySingleton<UserService>(
      () => UserService(client: _getIt()),
    );
  }

  static void _registerRepositories() {
    _getIt.registerLazySingleton<IUserRepository>(
      () => UserRepository(service: _getIt()),
    );
  }

  static void _registerViewModels() {
    _getIt.registerFactory<HomeViewModel>(
      () => HomeViewModel(userRepository: _getIt()),
    );
  }
}
