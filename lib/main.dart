import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'core/config/app_dependences.dart';
import 'core/routing/routing.dart';
import 'presentation/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  final getIt = AppDependences.registerModules();

  runApp(Bus2ChanllengerApp(getIt: getIt));
}

class Bus2ChanllengerApp extends StatelessWidget {
  const Bus2ChanllengerApp({super.key, required this.getIt});

  final GetIt getIt;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bus2 Chanllenger App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.createRouter(getIt),
    );
  }
}
