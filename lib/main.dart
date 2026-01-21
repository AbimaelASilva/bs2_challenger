import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/config/app_dependences.dart';
import 'core/routing/routing.dart';
import 'presentation/shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final getIt = AppDependences.registerModules();

  runApp(MyApp(getIt: getIt));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.getIt});

  final GetIt getIt;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Random Users',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.createRouter(getIt),
    );
  }
}
