import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/data.dart';
import '../../data/services/local_storage/local_storage.dart';
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
    _getIt.registerLazySingleton<GetStorage>(
      GetStorage.new,
    );

    _getIt.registerLazySingleton<RestClient>(
      () => GenericClientAdapter(
        dio: Dio(),
      ),
    );
  }

  static void _registerServices() {
    _getIt.registerLazySingleton<UserService>(
      () => UserService(
        client: _getIt(),
        storage: _getIt(),
      ),
    );

    _getIt.registerLazySingleton<UserLocalStorageService>(
      () => UserLocalStorageService(storage: _getIt()),
    );
  }

  static void _registerRepositories() {
    _getIt.registerLazySingleton<IUserRepository>(
      () => UserRepository(
        service: _getIt(),
        localStorageService: _getIt(),
      ),
    );
  }

  static void _registerViewModels() {
    _getIt.registerFactory<HomeViewModel>(
      () => HomeViewModel(userRepository: _getIt()),
    );

    _getIt.registerFactory<SavedViewModel>(
      () => SavedViewModel(userRepository: _getIt()),
    );

    _getIt.registerFactoryParam<UserDetailsViewModel, IUserRepository, String>(
      (repository, userId) => UserDetailsViewModel(
        userRepository: repository,
        userId: userId,
      ),
    );
  }
}
