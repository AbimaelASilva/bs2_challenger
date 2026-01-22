import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'core/config/app_dependences.dart';
import 'core/helper/helper.dart';
import 'core/routing/routing.dart';
import 'core/services/locale_service.dart';
import 'presentation/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  final getIt = AppDependences.registerModules();

  runApp(Bus2ChanllengerApp(getIt: getIt));
}

class Bus2ChanllengerApp extends StatefulWidget {
  const Bus2ChanllengerApp({super.key, required this.getIt});

  final GetIt getIt;

  @override
  State<Bus2ChanllengerApp> createState() => _Bus2ChanllengerAppState();
}

class _Bus2ChanllengerAppState extends State<Bus2ChanllengerApp> {
  @override
  void initState() {
    super.initState();
    LocaleService.getLocale();
    LocaleService.localeNotifier.addListener(_onLocaleChanged);
  }

  @override
  void dispose() {
    LocaleService.localeNotifier.removeListener(_onLocaleChanged);
    super.dispose();
  }

  void _onLocaleChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: LocaleService.localeNotifier,
      builder: (context, locale, child) {
        return MaterialApp.router(
          title: 'Bus2 Chanllenger App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          locale: locale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: LocaleService.getSupportedLocales(),
          routerConfig: AppRouter.createRouter(widget.getIt),
        );
      },
    );
  }
}
