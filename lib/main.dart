import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/home/home_page.dart';

import 'ui/core/localization/localization.dart';
import 'ui/core/localization/map/map_localizations.dart';
import 'ui/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const FieldMapApp());
}

class FieldMapApp extends StatefulWidget {
  const FieldMapApp({super.key});

  @override
  State<FieldMapApp> createState() => _FieldMapAppState();
}

class _FieldMapAppState extends State<FieldMapApp> {
  Locale _locale = const Locale('en');

  void _changeLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'Desafio Bus2',
          debugShowCheckedModeBanner: false,
          locale: _locale,
          // Use apenas os delegates e locais suportados pelo app
          localizationsDelegates: [
            ...context.localizationsDelegates!
                .where((d) => d == MapLocalizations.delegate),
            MapLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: MapLocalizations.supportedLocales,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: HomePage(
            onChangeLocale: _changeLocale,
            currentLocale: _locale,
          ),
        );
      },
    );
  }
}
