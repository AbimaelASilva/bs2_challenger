import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'core/config/config.dart';
import 'core/config/environment.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver(this.showLog);
  final bool showLog;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (showLog) {
      log('onChange(${bloc.runtimeType}, $change)');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (showLog) {
      log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    }
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function(bool showLog, GetIt getIt) builder, {
  bool showLog = kDebugMode,
}) async {
  FlutterError.onError = (details) {
    if (showLog) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    }
  };

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    log('🔧 WidgetsFlutterBinding inicializado');

    Bloc.observer = AppBlocObserver(showLog);

    // Ensure GetStorage is initialized before proceeding
    try {
      await GetStorage.init();
      log('✅ GetStorage inicializado');
    } catch (e, s) {
      log('❌ Erro em GetStorage.init(): $e\n$s');
      rethrow;
    }

    // Inicializa o ambiente antes de registrar as dependências
    await EnvironmentConfig.initialize(Environment.prod);

    final getIt = AppDependences.registerModules();
    try {
      await getIt.allReady();
      log('✅ Dependências registradas');
    } catch (e, s) {
      log('❌ Erro em getIt.allReady(): $e\n$s');
      rethrow;
    }

    try {
      final app = await builder(showLog, getIt);
      log('✅ Widget da aplicação criado');
      runApp(app);
    } catch (e, s) {
      log('❌ Erro ao construir e rodar app: $e\n$s');
      rethrow;
    }
  }, (e, s) {
    log('❌ runZonedGuarded: $e\n$s');
    throw e;
  });
}

/*
Future<void> bootstrap(
  FutureOr<Widget> Function(bool showLog, GetIt getIt) builder, {
  bool showLog = kDebugMode,
}) async {
  FlutterError.onError = (details) {
    if (showLog) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    }
  };

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = AppBlocObserver(showLog);
    print('🔧 WidgetsFlutterBinding inicializado');

    try {
      await GetStorage.init();
      print('✅ GetStorage inicializado');
    } catch (e, s) {
      print('❌ Erro em GetStorage.init(): $e\n$s');
    }

    GetIt getIt;
    try {
      getIt = AppDependences.registerModules();
      print('✅ Dependências registradas');
    } catch (e, s) {
      print('❌ Erro em registerModules(): $e\n$s');
      rethrow;
    }

    try {
      await getIt.allReady(timeout: const Duration(seconds: 5));
      print('✅ AllReady completo');
    } catch (e, s) {
      print('❌ Erro em getIt.allReady(): $e\n$s');
      rethrow;
    }

    try {
      final app = await builder(showLog, getIt);
      print('✅ Widget da aplicação criado');
      runApp(app);
    } catch (e, s) {
      print('❌ Erro ao construir e rodar app: $e\n$s');
    }
  }, (e, s) {
    print('❌ runZonedGuarded: $e\n$s');
  });
}
*/
